import 'dart:ui';

import 'package:globenotes/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefKeyLang = 'pref_key_lang';
const String prefKeyOnboardingScreen = 'pref_key_onboarding_screen';
const String prefKeyIsUserLoggedIn = 'pref_key_is_user_logged_in';
const String prefKeyIsInitialSyncDone = 'pref_key_is_initial_sync_done';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<Locale> getAppLanguage() async {
    String? languageCode = _sharedPreferences.getString(prefKeyLang);

    if (languageCode != null && languageCode.isNotEmpty) {
      return AppLanguages.getLocaleFromCode(languageCode);
    } else {
      return AppLanguages.english;
    }
  }

  Future<void> setAppLanguage(Locale locale) async {
    String languageCode = locale.languageCode;
    await _sharedPreferences.setString(prefKeyLang, languageCode);
  }

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(prefKeyOnboardingScreen, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(prefKeyOnboardingScreen) ?? false;
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(prefKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefKeyIsUserLoggedIn) ?? false;
  }

  Future<void> setIsInitialSyncDone() async {
    _sharedPreferences.setBool(prefKeyIsInitialSyncDone, true);
  }

  Future<bool> isInitialSyncDone() async {
    return _sharedPreferences.getBool(prefKeyIsInitialSyncDone) ?? false;
  }
}
