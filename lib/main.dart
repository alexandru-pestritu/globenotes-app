import 'package:flutter/material.dart';
import 'package:globenotes/app/app.dart';
import 'package:globenotes/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
