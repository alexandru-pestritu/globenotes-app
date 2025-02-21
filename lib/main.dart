import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/app/app.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/resources/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(
    EasyLocalization(
      supportedLocales: AppLanguages.supportedLocales,
      path: AppLanguages.basePath,
      fallbackLocale: AppLanguages.english,
      child: MyApp(),
    ),
  );
}
