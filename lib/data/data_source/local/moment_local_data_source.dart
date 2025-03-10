import 'package:globenotes/data/database/app_database.dart';

abstract class MomentsLocalDataSource {
  Future<MomentsLocalData> insertMoment(MomentsLocalCompanion moment);
  Future<List<MomentsLocalData>> getAllMoments();
  Future<MomentsLocalData> getMoment(int localId);
  Future<bool> updateMoment(MomentsLocalData moment);
  Future<int> deleteMoment(int localId);
  Future<int> deleteAllMoments();
}

class MomentsLocalDataSourceImpl implements MomentsLocalDataSource {
  final AppDatabase _db;

  MomentsLocalDataSourceImpl(this._db);

  @override
  Future<MomentsLocalData> insertMoment(MomentsLocalCompanion moment) async {
    if (moment.serverId.present && moment.serverId.value != null) {
      final existing =
          await (_db.select(_db.momentsLocal)..where(
            (tbl) => tbl.serverId.equals(moment.serverId.value!),
          )).getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final momentId = await _db.into(_db.momentsLocal).insert(moment);
    return await (_db.select(_db.momentsLocal)
      ..where((tbl) => tbl.localId.equals(momentId))).getSingle();
  }

  @override
  Future<List<MomentsLocalData>> getAllMoments() {
    return _db.select(_db.momentsLocal).get();
  }

  @override
  Future<MomentsLocalData> getMoment(int localId) {
    return (_db.select(_db.momentsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateMoment(MomentsLocalData moment) {
    return _db.update(_db.momentsLocal).replace(moment);
  }

  @override
  Future<int> deleteMoment(int localId) {
    return (_db.delete(_db.momentsLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllMoments() {
    return _db.delete(_db.momentsLocal).go();
  }
}
