import 'package:dartz/dartz.dart';
import 'package:globenotes/data/data_source/local/sync_history_local_data_source.dart';
import 'package:globenotes/data/mapper/sync_history_mapper.dart';
import 'package:globenotes/data/network/error_handler.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/sync_repository.dart';

class SyncRepositoryImpl implements SyncRepository {
  final SyncHistoryLocalDataSource _syncHistoryLocalDataSource;

  SyncRepositoryImpl(
    this._syncHistoryLocalDataSource
  );

  @override
  Future<Either<Failure, SyncHistoryEntry>> addSyncHistory(SyncHistoryEntry entry) async {
    try {
      final companion = entry.toCompanion();

      final insertedRow = await _syncHistoryLocalDataSource.insertSyncHistory(companion);

      final domainEntry = insertedRow.toDomain();

      return Right(domainEntry);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}