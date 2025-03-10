import 'package:drift/drift.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/data/database/sync_status.dart';
import 'package:globenotes/data/dto/user_profile/user_profile_dtos.dart';
import 'package:globenotes/data/mapper/location_mapper.dart';
import 'package:globenotes/domain/model/model.dart';

extension UserProfileDetailsDTOToCompanion on UserProfileDetailsDTO {
  UserProfilesLocalCompanion toCompanion({
    required int userLocalId,
    required int locationLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return UserProfilesLocalCompanion(
      serverId: Value(id?.toString()),
      userLocalId: Value(userLocalId),
      name: Value(name ?? ''),
      profilePhotoUrl: Value(profilePhotoUrl),
      coverPhotoUrl: Value(coverPhotoUrl),
      profileLocalFilePath: const Value.absent(),
      coverLocalFilePath: const Value.absent(),
      bio: Value(bio),
      locationLocalId: Value(locationLocalId),
      updatedAt: Value(
        DateTime.tryParse(updatedAt ?? '')?.toUtc() ?? DateTime.now().toUtc(),
      ),
      syncStatus: Value(syncStatus),
    );
  }
}

extension UserProfileDetailsDTOToLocalData on UserProfileDetailsDTO {
  UserProfilesLocalData toLocalData({
    required UserProfilesLocalData existingData,
    required int locationLocalId,
    String syncStatus = SyncStatus.synced,
  }) {
    return existingData.copyWith(
      serverId: Value(id?.toString()),
      name: name ?? '',
      profilePhotoUrl: Value(profilePhotoUrl),
      coverPhotoUrl: Value(coverPhotoUrl),
      profileLocalFilePath: Value(existingData.profileLocalFilePath),
      coverLocalFilePath: Value(existingData.coverLocalFilePath),
      bio: Value(bio),
      locationLocalId: locationLocalId,
      updatedAt: DateTime.tryParse(updatedAt ?? '')?.toUtc() ??
          DateTime.now().toUtc(),
      syncStatus: syncStatus,
    );
  }
}

extension UserProfileLocalDataToDomain on UserProfilesLocalData {
  UserProfile toDomain({
    Location? location,
  }) {
    return UserProfile(
      serverId: serverId ?? '',
      localId: localId,
      name: name,
      profilePhotoUrl: profilePhotoUrl,
      coverPhotoUrl: coverPhotoUrl,
      profileLocalFilePath: profileLocalFilePath,
      coverLocalFilePath: coverLocalFilePath,
      bio: bio,
      updatedAt: updatedAt.toIso8601String(),
      location: location,
    );
  }
}

extension UserProfileDomainToLocalData on UserProfile {
  UserProfilesLocalData toLocalData({
    required int userLocalId,
    String syncStatus = SyncStatus.pendingAdd,
  }) {
    return UserProfilesLocalData(
      localId: localId,
      serverId: serverId.toString(),
      userLocalId: userLocalId,
      name: name,
      profilePhotoUrl: profilePhotoUrl,
      coverPhotoUrl: coverPhotoUrl,
      profileLocalFilePath: profileLocalFilePath,
      coverLocalFilePath: coverLocalFilePath,
      bio: bio,
      locationLocalId: (location?.localId ?? 0),
      updatedAt: DateTime.tryParse(updatedAt)?.toUtc() ?? DateTime.now().toUtc(),
      syncStatus: syncStatus,
    );
  }
}

extension UserProfileDomainToDetailsDTO on UserProfile {
  UserProfileDetailsDTO toDetailsDTO() {
    return UserProfileDetailsDTO(
      id: int.tryParse(serverId!),
      name: name,
      profilePhotoUrl: profilePhotoUrl,
      coverPhotoUrl: coverPhotoUrl,
      bio: bio,
      updatedAt: updatedAt,
      location: location?.toDetailsDTO(),
    );
  }
}