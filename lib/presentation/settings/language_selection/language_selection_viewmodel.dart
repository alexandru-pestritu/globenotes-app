import 'dart:async';
import 'package:flutter/material.dart';
import 'package:globenotes/app/app_preferences.dart';
import 'package:globenotes/presentation/base/base_viewmodel.dart';

class LanguageSelectionViewModel extends BaseViewModel {
  final AppPreferences _appPreferences;
  final StreamController<Locale> _selectedLanguageStreamController =
      StreamController<Locale>.broadcast();

  LanguageSelectionViewModel(this._appPreferences);

  Stream<Locale> get selectedLanguageStream =>
      _selectedLanguageStreamController.stream;

  @override
  void start() {
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    Locale locale = await _appPreferences.getAppLanguage();
    _selectedLanguageStreamController.add(locale);
  }

  Future<void> changeLanguage(Locale locale) async {
    await _appPreferences.setAppLanguage(locale);
    _selectedLanguageStreamController.add(locale);
  }

  @override
  void dispose() {
    _selectedLanguageStreamController.close();
    super.dispose();
  }
}

