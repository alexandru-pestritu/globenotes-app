import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal();
  int appState = 0;
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationLightTheme(),
      darkTheme: getApplicationDarkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
