import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/sync_repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class GetUserProfileUseCase extends BaseUseCase<void, SyncHistoryEntry> {
  final SyncRepository _syncRepository;

  GetUserProfileUseCase(this._syncRepository);

  @override
  Future<Either<Failure, SyncHistoryEntry>> execute(void request) {
    return _syncRepository.getLatestSyncHistory();
  }
}
