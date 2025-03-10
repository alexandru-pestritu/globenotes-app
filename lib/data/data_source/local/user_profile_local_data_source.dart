import 'package:globenotes/data/database/app_database.dart';

abstract class UserProfilesLocalDataSource {
  Future<UserProfilesLocalData> insertUserProfile(
    UserProfilesLocalCompanion profile,
  );
  Future<List<UserProfilesLocalData>> getAllUserProfiles();
  Future<UserProfilesLocalData> getUserProfile(int localId);
  Future<bool> updateUserProfile(UserProfilesLocalData profile);
  Future<int> deleteUserProfile(int localId);
  Future<int> deleteAllUserProfiles();
}

class UserProfilesLocalDataSourceImpl implements UserProfilesLocalDataSource {
  final AppDatabase _db;

  UserProfilesLocalDataSourceImpl(this._db);

  @override
  Future<UserProfilesLocalData> insertUserProfile(
    UserProfilesLocalCompanion profile,
  ) async {
    if (profile.serverId.present && profile.serverId.value != null) {
      final existing =
          await (_db.select(_db.userProfilesLocal)..where(
            (tbl) => tbl.serverId.equals(profile.serverId.value!),
          )).getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final profileId = await _db.into(_db.userProfilesLocal).insert(profile);
    return await (_db.select(_db.userProfilesLocal)
      ..where((tbl) => tbl.localId.equals(profileId))).getSingle();
  }

  @override
  Future<List<UserProfilesLocalData>> getAllUserProfiles() {
    return _db.select(_db.userProfilesLocal).get();
  }

  @override
  Future<UserProfilesLocalData> getUserProfile(int localId) {
    return (_db.select(_db.userProfilesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateUserProfile(UserProfilesLocalData profile) {
    return _db.update(_db.userProfilesLocal).replace(profile);
  }

  @override
  Future<int> deleteUserProfile(int localId) {
    return (_db.delete(_db.userProfilesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllUserProfiles() {
    return _db.delete(_db.userProfilesLocal).go();
  }
}
