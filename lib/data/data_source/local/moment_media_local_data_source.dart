import 'package:globenotes/data/database/app_database.dart';

abstract class MomentMediaLocalDataSource {
  Future<MomentMediaLocalData> insertMomentMedia(MomentMediaLocalCompanion media);
  Future<List<MomentMediaLocalData>> getAllMomentMedia();
  Future<MomentMediaLocalData> getMomentMedia(int localId);
  Future<bool> updateMomentMedia(MomentMediaLocalData media);
  Future<int> deleteMomentMedia(int localId);
  Future<int> deleteAllMomentMedia();
}

class MomentMediaLocalDataSourceImpl implements MomentMediaLocalDataSource {
  final AppDatabase _db;

  MomentMediaLocalDataSourceImpl(this._db);

  @override
  Future<MomentMediaLocalData> insertMomentMedia(MomentMediaLocalCompanion media) async {
    if (media.serverId.present && media.serverId.value != null) {
      final existing = await (_db.select(_db.momentMediaLocal)
            ..where((tbl) => tbl.serverId.equals(media.serverId.value!)))
          .getSingleOrNull();
      if (existing != null) {
        return existing;
      }
    }
    final mediaId = await _db.into(_db.momentMediaLocal).insert(media);
    return await (_db.select(_db.momentMediaLocal)
          ..where((tbl) => tbl.localId.equals(mediaId)))
        .getSingle();
  }

  @override
  Future<List<MomentMediaLocalData>> getAllMomentMedia() {
    return _db.select(_db.momentMediaLocal).get();
  }

  @override
  Future<MomentMediaLocalData> getMomentMedia(int localId) {
    return (_db.select(_db.momentMediaLocal)
      ..where((tbl) => tbl.localId.equals(localId))).getSingle();
  }

  @override
  Future<bool> updateMomentMedia(MomentMediaLocalData media) {
    return _db.update(_db.momentMediaLocal).replace(media);
  }

  @override
  Future<int> deleteMomentMedia(int localId) {
    return (_db.delete(_db.momentMediaLocal)
      ..where((tbl) => tbl.localId.equals(localId))).go();
  }

  @override
  Future<int> deleteAllMomentMedia() {
    return _db.delete(_db.momentMediaLocal).go();
  }
}
