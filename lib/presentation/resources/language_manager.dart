import 'package:flutter/material.dart';

class AppLanguages {
  static const String basePath = 'assets/translations';

  static const Locale english = Locale('en', 'US');
  static const Locale romanian = Locale('ro', 'RO');
  static const Locale german = Locale('de', 'DE');
  static const Locale french = Locale('fr', 'FR');
  static const Locale spanish = Locale('es', 'ES');

  static final List<Locale> supportedLocales = [
    english,
    romanian,
    german,
    french,
    spanish,
  ];

  static final List<LanguageModel> languageList = [
    LanguageModel(
      locale: english,
      languageCode: "us",
      translationKey: "language_english",
    ),
    LanguageModel(
      locale: romanian,
      languageCode: "ro",
      translationKey: "language_romanian",
    ),
    LanguageModel(
      locale: german,
      languageCode: "de",
      translationKey: "language_german",
    ),
    LanguageModel(
      locale: french,
      languageCode: "fr",
      translationKey: "language_french",
    ),
    LanguageModel(
      locale: spanish,
      languageCode: "es",
      translationKey: "language_spanish",
    ),
  ];

  static Locale getLocaleFromCode(String code) {
    return languageList
        .firstWhere(
          (lang) => lang.languageCode == code,
          orElse:
              () => LanguageModel(
                locale: english,
                languageCode: "us",
                translationKey: "language_english",
              ),
        )
        .locale;
  }
}

class LanguageModel {
  final Locale locale;
  final String languageCode;
  final String translationKey;

  LanguageModel({
    required this.locale,
    required this.languageCode,
    required this.translationKey,
  });
}
