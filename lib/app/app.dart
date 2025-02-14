import 'package:flutter/material.dart';
import 'package:globenotes/presentation/theme_manager.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal();
  int appState = 0;
  static final MyApp instance =
      MyApp._internal();

  factory MyApp() => instance;

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}