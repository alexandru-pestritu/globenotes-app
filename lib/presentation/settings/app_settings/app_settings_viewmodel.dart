import 'dart:async';
import 'package:globenotes/app/app_preferences.dart';
import 'package:globenotes/app/extensions.dart';
import 'package:globenotes/domain/usecase/sync/get_latest_sync_history.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';
import 'package:globenotes/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:globenotes/presentation/resources/units_manager.dart';
import 'package:rxdart/rxdart.dart';

class AppSettingsViewModel extends BaseViewModel
    with AppSettingsViewModelInputs, AppSettingsViewModelOutputs {
  final AppPreferences _appPreferences;
  final GetLatestSyncUseCase _getLatestSyncUseCase;

  final _syncOnMobileDataSubject = BehaviorSubject<bool>.seeded(false);
  final _hiResPhotoUploadSubject = BehaviorSubject<bool>.seeded(true);
  final _distanceUnitKeySubject = BehaviorSubject<String>.seeded(
    DistanceUnit.kilometers.key,
  );
  final _temperatureUnitKeySubject = BehaviorSubject<String>.seeded(
    TemperatureUnit.celsius.key,
  );
  final _lastSyncSubject = BehaviorSubject<String>.seeded('');

  AppSettingsViewModel(this._appPreferences, this._getLatestSyncUseCase);

  @override
  void start() async {
    final syncOnMobileData = await _appPreferences.getSyncOnMobileData();
    final hiResPhotoUpload = await _appPreferences.getHiResPhotoUpload();
    final distanceUnitKey = await _appPreferences.getDistanceUnit();
    final temperatureUnitKey = await _appPreferences.getTemperatureUnit();

    _syncOnMobileDataSubject.add(syncOnMobileData);
    _hiResPhotoUploadSubject.add(hiResPhotoUpload);
    _distanceUnitKeySubject.add(distanceUnitKey);
    _temperatureUnitKeySubject.add(temperatureUnitKey);

    final result = await _getLatestSyncUseCase.execute(null);
    result.fold(
      (failure) {
        _lastSyncSubject.add('');
        inputState.add(ContentState());
      },
      (syncHistoryEntry) {
        final syncTime = syncHistoryEntry.syncTime.toFormattedTimestamp();
        _lastSyncSubject.add(syncTime);
        inputState.add(ContentState());
      },
    );
  }

  @override
  void setSyncOnMobileData(bool value) async {
    await _appPreferences.setSyncOnMobileData(value);
    _syncOnMobileDataSubject.add(value);
  }

  @override
  void setHiResPhotoUpload(bool value) async {
    await _appPreferences.setHiResPhotoUpload(value);
    _hiResPhotoUploadSubject.add(value);
  }

  @override
  void setDistanceUnit(String key) async {
    await _appPreferences.setDistanceUnit(key);
    _distanceUnitKeySubject.add(key);
  }

  @override
  void setTemperatureUnit(String key) async {
    await _appPreferences.setTemperatureUnit(key);
    _temperatureUnitKeySubject.add(key);
  }

  @override
  void triggerManualSync() {}

  @override
  Stream<bool> get outputSyncOnMobileData => _syncOnMobileDataSubject.stream;
  @override
  Stream<bool> get outputHiResPhotoUpload => _hiResPhotoUploadSubject.stream;
  @override
  Stream<String> get outputDistanceUnit => _distanceUnitKeySubject.stream;
  @override
  Stream<String> get outputTemperatureUnit => _temperatureUnitKeySubject.stream;
  @override
  Stream<String> get outputLastSync => _lastSyncSubject.stream;

  @override
  void dispose() {
    _syncOnMobileDataSubject.close();
    _hiResPhotoUploadSubject.close();
    _distanceUnitKeySubject.close();
    _temperatureUnitKeySubject.close();
    _lastSyncSubject.close();
    super.dispose();
  }
}

mixin AppSettingsViewModelInputs {
  void setSyncOnMobileData(bool value);
  void setHiResPhotoUpload(bool value);
  void setDistanceUnit(String key);
  void setTemperatureUnit(String key);
  void triggerManualSync();
}

mixin AppSettingsViewModelOutputs {
  Stream<bool> get outputSyncOnMobileData;
  Stream<bool> get outputHiResPhotoUpload;
  Stream<String> get outputDistanceUnit;
  Stream<String> get outputTemperatureUnit;
  Stream<String> get outputLastSync;
}
