import 'dart:async';
import 'package:globenotes/domain/usecase/base_usecase.dart';
import 'package:globenotes/domain/usecase/initial_sync_usecase.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/app/app_preferences.dart';

class InitialSyncViewModel extends BaseViewModel
    with InitialSyncViewModelInputs, InitialSyncViewModelOutputs {
  final InitialSyncUseCase _initialSyncUseCase;
  final AppPreferences _appPreferences;

  final StreamController<double> _syncProgressController =
      StreamController<double>.broadcast();

  final StreamController<bool> _isSyncFailedController =
      StreamController<bool>.broadcast();

  final StreamController<bool> _isSyncSuccessfulController =
      StreamController<bool>.broadcast();

  InitialSyncViewModel(this._initialSyncUseCase, this._appPreferences);

  @override
  void start() async {
    bool isDone = await _appPreferences.isInitialSyncDone();
    if (isDone) {
      _isSyncSuccessfulController.add(true);
      return;
    }

    _performSync();
  }

  @override
  void dispose() {
    _syncProgressController.close();
    _isSyncFailedController.close();
    _isSyncSuccessfulController.close();
    super.dispose();
  }

  @override
  void retrySync() {
    _isSyncFailedController.add(false);
    _syncProgressController.add(0.0);
    _performSync();
  }

  @override
  Sink<double> get inputSyncProgress => _syncProgressController.sink;
  @override
  Sink<bool> get inputIsSyncFailed => _isSyncFailedController.sink;
  @override
  Sink<bool> get inputIsSyncSuccessful => _isSyncSuccessfulController.sink;

  @override
  Stream<double> get outputSyncProgress =>
      _syncProgressController.stream.map((progress) => progress);

  @override
  Stream<bool> get outputIsSyncFailed => _isSyncFailedController.stream;

  @override
  Stream<bool> get outputIsSyncSuccessful => _isSyncSuccessfulController.stream;

  void _performSync() {
    _initialSyncUseCase.execute(const NoParams()).listen((either) {
      either.fold(
        (failure) {
          inputState.add(
            ErrorState(StateRendererType.fullScreenErrorState, failure.message),
          );
          inputIsSyncFailed.add(true);
        },
        (progressValue) async {
          if (progressValue < 1.0) {
            inputSyncProgress.add(progressValue);
            inputState.add(ContentState());
          } else {
            inputSyncProgress.add(1.0);

            await _appPreferences.setIsInitialSyncDone();

            inputState.add(ContentState());
            inputIsSyncSuccessful.add(true);
          }
        },
      );
    });
  }
}

mixin InitialSyncViewModelInputs {
  void retrySync();
  Sink<double> get inputSyncProgress;
  Sink<bool> get inputIsSyncFailed;
  Sink<bool> get inputIsSyncSuccessful;
}

mixin InitialSyncViewModelOutputs {
  Stream<double> get outputSyncProgress;
  Stream<bool> get outputIsSyncFailed;
  Stream<bool> get outputIsSyncSuccessful;
}
