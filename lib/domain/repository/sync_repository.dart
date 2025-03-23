import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';

abstract class SyncRepository {
  Future<Either<Failure, SyncHistoryEntry>> addSyncHistory(
    SyncHistoryEntry entry,
  );
  Future<Either<Failure, SyncHistoryEntry>> getLatestSyncHistory();
}
