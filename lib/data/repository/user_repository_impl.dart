import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:globenotes/data/data_source/local/continent_local_data_source.dart';
import 'package:globenotes/data/data_source/local/country_local_data_source.dart';
import 'package:globenotes/data/data_source/local/location_local_data_source.dart';
import 'package:globenotes/data/data_source/local/user_local_data_source.dart';
import 'package:globenotes/data/data_source/local/user_profile_local_data_source.dart';
import 'package:globenotes/data/data_source/local/user_visited_country_local_data_source.dart';
import 'package:globenotes/data/data_source/remote/user_remote_data_source.dart';
import 'package:globenotes/data/dto/continent/continent_dtos.dart';
import 'package:globenotes/data/dto/country/country_dtos.dart';
import 'package:globenotes/data/dto/location/location_dtos.dart';
import 'package:globenotes/data/dto/user_visited_country/user_visited_country_dtos.dart';
import 'package:globenotes/data/mapper/continent_mapper.dart';
import 'package:globenotes/domain/repository/user_repository.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/mapper/user_profile_mapper.dart';
import 'package:globenotes/data/mapper/user_visited_country_mapper.dart';
import 'package:globenotes/data/mapper/location_mapper.dart';
import 'package:globenotes/data/mapper/country_mapper.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/domain/model/model.dart';

import 'package:globenotes/data/data_source/remote/s3_file_manager.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  final UsersLocalDataSource _usersLocalDataSource;
  final UserProfilesLocalDataSource _userProfilesLocalDataSource;
  final UserVisitedCountriesLocalDataSource _visitedCountriesLocalDataSource;
  final LocationsLocalDataSource _locationsLocalDataSource;
  final CountriesLocalDataSource _countriesLocalDataSource;
  final ContinentsLocalDataSource _continentsLocalDataSource;

  final S3FileManager _fileManager;
  final NetworkInfo _networkInfo;

  UserRepositoryImpl(
    this._userRemoteDataSource,
    this._usersLocalDataSource,
    this._userProfilesLocalDataSource,
    this._visitedCountriesLocalDataSource,
    this._locationsLocalDataSource,
    this._countriesLocalDataSource,
    this._continentsLocalDataSource,
    this._fileManager,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, bool>>
  fetchUserProfileFromServerAndSaveToLocal() async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final response = await _userRemoteDataSource.getUserProfile();
      if (response.statusCode == ResponseCode.success) {
        final profileDTO = response.data?.profile;
        if (profileDTO == null) {
          return const Right(true);
        }

        final allUsers = await _usersLocalDataSource.getAllUsers();
        if (allUsers.isEmpty) {
          return const Right(true);
        }
        final userLocalId = allUsers.first.localId;

        final locationLocalId = await _saveLocation(profileDTO.location);

        final profileCompanion = profileDTO.toCompanion(
          userLocalId: userLocalId,
          locationLocalId: locationLocalId ?? 0,
          syncStatus: SyncStatus.synced,
        );
        final insertedProfile = await _userProfilesLocalDataSource
            .insertUserProfile(profileCompanion);

        if (profileDTO.profilePhotoUrl != null) {
          final localPathResult = await _fileManager.downloadFileFromS3(
            s3Key: profileDTO.profilePhotoUrl!,
            subFolder: 'profile_images',
          );
          localPathResult.fold((failure) => null, (localPath) async {
            final updatedRow = insertedProfile.copyWith(
              profileLocalFilePath: Value(localPath),
            );
            await _userProfilesLocalDataSource.updateUserProfile(updatedRow);
          });
        }

        if (profileDTO.coverPhotoUrl != null) {
          final localPathResult = await _fileManager.downloadFileFromS3(
            s3Key: profileDTO.coverPhotoUrl!,
            subFolder: 'profile_images',
          );
          localPathResult.fold((failure) => null, (localPath) async {
            final updatedRow = insertedProfile.copyWith(
              coverLocalFilePath: Value(localPath),
            );
            await _userProfilesLocalDataSource.updateUserProfile(updatedRow);
          });
        }

        return const Right(true);
      } else {
        return Left(
          Failure(
            response.statusCode ?? ResponseCode.defaultError,
            response.message ?? ResponseMessage.defaultError,
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>>
  fetchUserVisitedCountriesFromServerAndSaveToLocal() async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final response = await _userRemoteDataSource.getVisitedCountries();
      if (response.statusCode == ResponseCode.success) {
        final visitedDTOList = response.data?.visitedCountries ?? [];

        await _visitedCountriesLocalDataSource.deleteAllUserVisitedCountries();

        for (final v in visitedDTOList) {
          await _saveVisitedCountry(v);
        }
        return const Right(true);
      } else {
        return Left(
          Failure(
            response.statusCode ?? ResponseCode.defaultError,
            response.message ?? ResponseMessage.defaultError,
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, UserProfile?>> getUserProfileLocal() async {
    try {
      final profiles = await _userProfilesLocalDataSource.getAllUserProfiles();
      if (profiles.isEmpty) {
        return const Right(null);
      }
      final p = profiles.first;

      Location? domainLocation;
      if (p.locationLocalId > 0) {
        final locData = await _locationsLocalDataSource.getLocation(
          p.locationLocalId,
        );
        final countryData = await _countriesLocalDataSource.getCountry(
          locData.countryLocalId,
        );

        final continentData = await _continentsLocalDataSource.getContinent(
          countryData.continentLocalId,
        );
        final domainContinent = continentData.toDomain();

        final domainCountry = countryData.toDomain(continent: domainContinent);
        domainLocation = locData.toDomain(country: domainCountry);
      }

      final domainProfile = p.toDomain(location: domainLocation);
      return Right(domainProfile);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<UserVisitedCountry>>>
  getUserVisitedCountriesLocal() async {
    try {
      final visitedLocal =
          await _visitedCountriesLocalDataSource.getAllUserVisitedCountries();
      final result = <UserVisitedCountry>[];

      for (final v in visitedLocal) {
        final countryData = await _countriesLocalDataSource.getCountry(
          v.countryLocalId,
        );

        final continentData = await _continentsLocalDataSource.getContinent(
          countryData.continentLocalId,
        );
        final domainContinent = continentData.toDomain();

        final domainCountry = countryData.toDomain(continent: domainContinent);
        final domainVisited = v.toDomain(country: domainCountry);
        result.add(domainVisited);
      }
      return Right(result);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<int?> _saveLocation(LocationDetailsDTO? locationDTO) async {
    if (locationDTO == null) {
      return null;
    }
    final countryLocalId = await _saveCountry(locationDTO.country);

    final locCompanion = locationDTO.toCompanion(
      countryLocalId: countryLocalId ?? 0,
      syncStatus: SyncStatus.synced,
    );
    final locData = await _locationsLocalDataSource.insertLocation(
      locCompanion,
    );
    return locData.localId;
  }

  Future<int?> _saveCountry(CountryDetailsDTO? countryDTO) async {
    if (countryDTO == null) return null;

    final continentLocalId = await _saveContinent(countryDTO.continent);

    final companion = CountryDTO(
      id: countryDTO.id,
      name: countryDTO.name,
      isoCode: countryDTO.isoCode,
    ).toCompanion(
      continentLocalId: continentLocalId ?? 0,
      syncStatus: SyncStatus.synced,
    );
    final inserted = await _countriesLocalDataSource.insertCountry(companion);
    return inserted.localId;
  }

  Future<int?> _saveContinent(ContinentDTO? continentDTO) async {
    if (continentDTO == null) return null;

    final contCompanion = continentDTO.toCompanion(
      syncStatus: SyncStatus.synced,
    );
    final inserted = await _continentsLocalDataSource.insertContinent(
      contCompanion,
    );
    return inserted.localId;
  }

  Future<void> _saveVisitedCountry(UserVisitedCountryDetailsDTO dto) async {
    final userLocalId = 1;

    final countryLocalId = await _saveCountry(dto.country);

    final companion = dto.toCompanion(
      userLocalId: userLocalId,
      countryLocalId: countryLocalId ?? 0,
      syncStatus: SyncStatus.synced,
    );
    await _visitedCountriesLocalDataSource.insertUserVisitedCountry(companion);
  }
}
