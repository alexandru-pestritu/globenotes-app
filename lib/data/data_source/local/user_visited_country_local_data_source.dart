import 'package:globenotes/data/database/app_database.dart';

abstract class UserVisitedCountriesLocalDataSource {
  Future<UserVisitedCountriesLocalData> insertUserVisitedCountry(
    UserVisitedCountriesLocalCompanion visitedCountry,
  );
  Future<List<UserVisitedCountriesLocalData>> getAllUserVisitedCountries();
  Future<UserVisitedCountriesLocalData> getUserVisitedCountry(int localId);
  Future<bool> updateUserVisitedCountry(
    UserVisitedCountriesLocalData visitedCountry,
  );
  Future<int> deleteUserVisitedCountry(int localId);
  Future<int> deleteAllUserVisitedCountries();
}

class UserVisitedCountriesLocalDataSourceImpl
    implements UserVisitedCountriesLocalDataSource {
  final AppDatabase _db;

  UserVisitedCountriesLocalDataSourceImpl(this._db);

  @override
  Future<UserVisitedCountriesLocalData> insertUserVisitedCountry(
    UserVisitedCountriesLocalCompanion visitedCountry,
  ) async {
    if (visitedCountry.serverId.present &&
        visitedCountry.serverId.value != null) {
      final existing =
          await (_db.select(_db.userVisitedCountriesLocal)..where(
            (tbl) => tbl.serverId.equals(visitedCountry.serverId.value!),
          )).getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final localId = await _db
        .into(_db.userVisitedCountriesLocal)
        .insert(visitedCountry);
    return await (_db.select(_db.userVisitedCountriesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<List<UserVisitedCountriesLocalData>> getAllUserVisitedCountries() {
    return _db.select(_db.userVisitedCountriesLocal).get();
  }

  @override
  Future<UserVisitedCountriesLocalData> getUserVisitedCountry(int localId) {
    return (_db.select(_db.userVisitedCountriesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateUserVisitedCountry(
    UserVisitedCountriesLocalData visitedCountry,
  ) {
    return _db.update(_db.userVisitedCountriesLocal).replace(visitedCountry);
  }

  @override
  Future<int> deleteUserVisitedCountry(int localId) {
    return (_db.delete(_db.userVisitedCountriesLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllUserVisitedCountries() {
    return _db.delete(_db.userVisitedCountriesLocal).go();
  }
}
