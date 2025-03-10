import 'package:globenotes/data/database/app_database.dart';

abstract class LocationsLocalDataSource {
  Future<LocationsLocalData> insertLocation(LocationsLocalCompanion location);
  Future<List<LocationsLocalData>> getAllLocations();
  Future<LocationsLocalData> getLocation(int localId);
  Future<bool> updateLocation(LocationsLocalData location);
  Future<int> deleteLocation(int localId);
  Future<int> deleteAllLocations();
}

class LocationsLocalDataSourceImpl implements LocationsLocalDataSource {
  final AppDatabase _db;

  LocationsLocalDataSourceImpl(this._db);

  @override
  Future<LocationsLocalData> insertLocation(
    LocationsLocalCompanion location,
  ) async {
    if (location.serverId.present && location.serverId.value != null) {
      final existing =
          await (_db.select(_db.locationsLocal)..where(
            (tbl) => tbl.serverId.equals(location.serverId.value!),
          )).getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final locationId = await _db.into(_db.locationsLocal).insert(location);
    return await (_db.select(_db.locationsLocal)
      ..where((tbl) => tbl.localId.equals(locationId))).getSingle();
  }

  @override
  Future<List<LocationsLocalData>> getAllLocations() {
    return _db.select(_db.locationsLocal).get();
  }

  @override
  Future<LocationsLocalData> getLocation(int localId) {
    return (_db.select(_db.locationsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateLocation(LocationsLocalData location) {
    return _db.update(_db.locationsLocal).replace(location);
  }

  @override
  Future<int> deleteLocation(int localId) {
    return (_db.delete(_db.locationsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllLocations() {
    return _db.delete(_db.locationsLocal).go();
  }
}
