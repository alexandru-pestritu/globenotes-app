import 'package:globenotes/data/database/app_database.dart';

abstract class ContinentsLocalDataSource {
  Future<ContinentsLocalData> insertContinent(
    ContinentsLocalCompanion continent,
  );
  Future<List<ContinentsLocalData>> getAllContinents();
  Future<ContinentsLocalData> getContinent(int localId);
  Future<bool> updateContinent(ContinentsLocalData continent);
  Future<int> deleteContinent(int localId);
  Future<int> deleteAllContinents();
}

class ContinentsLocalDataSourceImpl implements ContinentsLocalDataSource {
  final AppDatabase _db;

  ContinentsLocalDataSourceImpl(this._db);

  @override
  Future<ContinentsLocalData> insertContinent(
    ContinentsLocalCompanion continent,
  ) async {
    if (continent.serverId.present && continent.serverId.value != null) {
      final existing =
          await (_db.select(_db.continentsLocal)..where(
            (tbl) => tbl.serverId.equals(continent.serverId.value!),
          )).getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final continentId = await _db.into(_db.continentsLocal).insert(continent);
    return await (_db.select(_db.continentsLocal)
      ..where((tbl) => tbl.localId.equals(continentId))).getSingle();
  }

  @override
  Future<List<ContinentsLocalData>> getAllContinents() {
    return _db.select(_db.continentsLocal).get();
  }

  @override
  Future<ContinentsLocalData> getContinent(int localId) {
    return (_db.select(_db.continentsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateContinent(ContinentsLocalData continent) {
    return _db.update(_db.continentsLocal).replace(continent);
  }

  @override
  Future<int> deleteContinent(int localId) {
    return (_db.delete(_db.continentsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllContinents() {
    return _db.delete(_db.continentsLocal).go();
  }
}
