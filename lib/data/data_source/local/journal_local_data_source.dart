import 'package:globenotes/data/database/app_database.dart';

abstract class JournalsLocalDataSource {
  Future<JournalsLocalData> insertJournal(JournalsLocalCompanion journal);
  Future<List<JournalsLocalData>> getAllJournals();
  Future<JournalsLocalData> getJournal(int localId);
  Future<bool> updateJournal(JournalsLocalData journal);
  Future<int> deleteJournal(int localId);
  Future<int> deleteAllJournals();
}

class JournalsLocalDataSourceImpl implements JournalsLocalDataSource {
  final AppDatabase _db;

  JournalsLocalDataSourceImpl(this._db);

  @override
  Future<JournalsLocalData> insertJournal(
    JournalsLocalCompanion journal,
  ) async {
    if (journal.serverId.present && journal.serverId.value != null) {
      final existing =
          await (_db.select(_db.journalsLocal)..where(
            (tbl) => tbl.serverId.equals(journal.serverId.value!),
          )).getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final journalId = await _db.into(_db.journalsLocal).insert(journal);
    return await (_db.select(_db.journalsLocal)
      ..where((tbl) => tbl.localId.equals(journalId))).getSingle();
  }

  @override
  Future<List<JournalsLocalData>> getAllJournals() {
    return _db.select(_db.journalsLocal).get();
  }

  @override
  Future<JournalsLocalData> getJournal(int localId) {
    return (_db.select(_db.journalsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateJournal(JournalsLocalData journal) {
    return _db.update(_db.journalsLocal).replace(journal);
  }

  @override
  Future<int> deleteJournal(int localId) {
    return (_db.delete(_db.journalsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllJournals() {
    return _db.delete(_db.journalsLocal).go();
  }
}
