import 'package:globenotes/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefKeyLang = 'pref_key_lang';
const String prefKeyOnboardingScreen = 'pref_key_onboarding_screen';
const String prefKeyIsUserLoggedIn = 'pref_key_is_user_logged_in';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefKeyLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
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
}