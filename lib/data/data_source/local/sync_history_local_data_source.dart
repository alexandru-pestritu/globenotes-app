import 'package:globenotes/data/database/app_database.dart';

abstract class SyncHistoryLocalDataSource {
  Future<SyncHistoryData> insertSyncHistory(SyncHistoryCompanion syncHistory);
  Future<List<SyncHistoryData>> getAllSyncHistory();
  Future<SyncHistoryData> getSyncHistory(int localId);
  Future<bool> updateSyncHistory(SyncHistoryData syncHistory);
  Future<int> deleteSyncHistory(int localId);
  Future<int> deleteAllSyncHistory();
}

class SyncHistoryLocalDataSourceImpl implements SyncHistoryLocalDataSource {
  final AppDatabase _db;

  SyncHistoryLocalDataSourceImpl(this._db);

  @override
  Future<SyncHistoryData> insertSyncHistory(
    SyncHistoryCompanion syncHistory,
  ) async {
    final localId = await _db.into(_db.syncHistory).insert(syncHistory);

    return await (_db.select(_db.syncHistory)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<List<SyncHistoryData>> getAllSyncHistory() {
    return _db.select(_db.syncHistory).get();
  }

  @override
  Future<SyncHistoryData> getSyncHistory(int localId) {
    return (_db.select(_db.syncHistory)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateSyncHistory(SyncHistoryData syncHistory) {
    return _db.update(_db.syncHistory).replace(syncHistory);
  }

  @override
  Future<int> deleteSyncHistory(int localId) {
    return (_db.delete(_db.syncHistory)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllSyncHistory() {
    return _db.delete(_db.syncHistory).go();
  }
}
