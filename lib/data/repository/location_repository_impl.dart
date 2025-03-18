import 'package:dartz/dartz.dart';
import 'package:globenotes/data/data_source/local/continent_local_data_source.dart';
import 'package:globenotes/data/data_source/local/country_local_data_source.dart';
import 'package:globenotes/data/data_source/remote/location_remote_data_source.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/continent/continent_dtos.dart';
import 'package:globenotes/data/dto/country/country_dtos.dart';
import 'package:globenotes/data/mapper/continent_mapper.dart';
import 'package:globenotes/data/mapper/country_mapper.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/data/network/network_info.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource _locationRemoteDataSource;
  final ContinentsLocalDataSource _continentsLocalDataSource;
  final CountriesLocalDataSource _countriesLocalDataSource;
  final NetworkInfo _networkInfo;

  LocationRepositoryImpl(
    this._locationRemoteDataSource,
    this._continentsLocalDataSource,
    this._countriesLocalDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, bool>>
  fetchContinentsAndCountriesFromServerAndSaveToLocal() async {
    if (!await _networkInfo.isConnected) {
      return Left(DataSource.noInternetConnection.getFailure());
    }

    try {
      final response =
          await _locationRemoteDataSource.getAllContinentsWithCountries();
      if (response.statusCode == ResponseCode.success) {
        final continentsDTO = response.data?.continents ?? [];

        await _continentsLocalDataSource.deleteAllContinents();
        await _countriesLocalDataSource.deleteAllCountries();

        for (final continentDTO in continentsDTO) {
          final insertedContinentLocal = await _insertContinent(continentDTO);

          final countryDTOs = continentDTO.countries ?? [];
          for (final countryDTO in countryDTOs) {
            await _insertCountry(countryDTO, insertedContinentLocal.localId);
          }
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
  Future<Either<Failure, List<Country>>>
  getAllCountriesWithContinentsLocal() async {
    try {
      final localContinents =
          await _continentsLocalDataSource.getAllContinents();
      final continentMap = <int, Continent>{};
      for (final c in localContinents) {
        final domainContinent = c.toDomain();
        continentMap[c.localId] = domainContinent;
      }

      final localCountries = await _countriesLocalDataSource.getAllCountries();

      final domainCountries = <Country>[];
      for (final lc in localCountries) {
        final continent = continentMap[lc.continentLocalId];
        if (continent == null) {
          continue;
        }
        domainCountries.add(lc.toDomain(continent: continent));
      }

      return Right(domainCountries);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  Future<ContinentsLocalData> _insertContinent(
    ContinentDetailsDTO continentDTO,
  ) async {
    final continentCompanion = continentDTO.toCompanion(
      syncStatus: SyncStatus.synced,
    );

    final insertedContinent = await _continentsLocalDataSource.insertContinent(
      continentCompanion,
    );
    return insertedContinent;
  }

  Future<CountriesLocalData> _insertCountry(
    CountryDTO countryDTO,
    int continentLocalId,
  ) async {
    final countryCompanion = countryDTO.toCompanion(
      continentLocalId: continentLocalId,
      syncStatus: SyncStatus.synced,
    );

    final insertedCountry = await _countriesLocalDataSource.insertCountry(
      countryCompanion,
    );
    return insertedCountry;
  }
}
