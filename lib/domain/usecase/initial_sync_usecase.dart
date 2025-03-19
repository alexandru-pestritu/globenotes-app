import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/location_repository.dart';
import 'package:globenotes/domain/repository/moment_repository.dart';
import 'package:globenotes/domain/repository/user_repository.dart';
import 'package:globenotes/domain/repository/sync_repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class InitialSyncUseCase implements BaseUseCase<NoParams, bool> {
  final LocationRepository _locationRepository;
  final MomentRepository _momentRepository;
  final UserRepository _userRepository;
  final SyncRepository _syncRepository;

  InitialSyncUseCase(
    this._locationRepository,
    this._momentRepository,
    this._userRepository,
    this._syncRepository,
  );

  @override
  Future<Either<Failure, bool>> execute(NoParams input) async {
    final locationResult =
        await _locationRepository.fetchContinentsAndCountriesFromServerAndSaveToLocal();
    if (locationResult.isLeft()) {
      return locationResult;
    }

    final momentResult =
        await _momentRepository.fetchCategoriesFromServerAndSaveToLocal();
    if (momentResult.isLeft()) {
      return momentResult; 
    }

    final userProfileResult =
        await _userRepository.fetchUserProfileFromServerAndSaveToLocal();
    if (userProfileResult.isLeft()) {
      return userProfileResult;
    }

    final visitedResult =
        await _userRepository.fetchUserVisitedCountriesFromServerAndSaveToLocal();
    if (visitedResult.isLeft()) {
      return visitedResult;
    }

    final syncEntry = SyncHistoryEntry(
      localId: 0,
      syncStatus: 'OK',
      syncType: 'INITIAL',
      syncTime: DateTime.now().toUtc().toIso8601String(),
      syncMessage: 'Initial sync completed successfully',
    );
    final syncHistoryResult = await _syncRepository.addSyncHistory(syncEntry);
    if (syncHistoryResult.isLeft()) {
      return syncHistoryResult.map((_) => false); 
    }
    return const Right(true);
  }
}
