import 'package:dartz/dartz.dart';
import 'package:globenotes/data/network/failure.dart';
import 'package:globenotes/domain/model/model.dart';
import 'package:globenotes/domain/repository/location_repository.dart';
import 'package:globenotes/domain/repository/moment_repository.dart';
import 'package:globenotes/domain/repository/user_repository.dart';
import 'package:globenotes/domain/repository/sync_repository.dart';
import 'package:globenotes/domain/usecase/base_usecase.dart';

class InitialSyncUseCase
    implements BaseUseCaseWithProgress<NoParams, double> {
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
  Stream<Either<Failure, double>> execute(NoParams input) async* {
    yield const Right(0.0);

    final locationResult =
        await _locationRepository.fetchContinentsAndCountriesFromServerAndSaveToLocal();
    if (locationResult.isLeft()) {
      yield locationResult.map((r) => 0.0);
      return;
    }
    yield const Right(0.25);

    final momentResult =
        await _momentRepository.fetchCategoriesFromServerAndSaveToLocal();
    if (momentResult.isLeft()) {
      yield momentResult.map((r) => 0.25);
      return;
    }
    yield const Right(0.5);

    final userProfileResult =
        await _userRepository.fetchUserProfileFromServerAndSaveToLocal();
    if (userProfileResult.isLeft()) {
      yield userProfileResult.map((r) => 0.5);
      return;
    }
    yield const Right(0.75);

    final visitedResult =
        await _userRepository.fetchUserVisitedCountriesFromServerAndSaveToLocal();
    if (visitedResult.isLeft()) {
      yield visitedResult.map((r) => 0.75);
      return;
    }
    yield const Right(0.9);

    final syncEntry = SyncHistoryEntry(
      localId: 0,
      syncStatus: 'OK',
      syncType: 'INITIAL',
      syncTime: DateTime.now().toUtc().toIso8601String(),
      syncMessage: 'Initial sync completed successfully',
    );
    final syncHistoryResult = await _syncRepository.addSyncHistory(syncEntry);
    if (syncHistoryResult.isLeft()) {
      yield syncHistoryResult.map((_) => 0.9);
      return;
    }

    yield const Right(1.0);
  }
}
