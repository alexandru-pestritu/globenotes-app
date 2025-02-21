import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';

class JournalsPage extends StatefulWidget {
  const JournalsPage({super.key});

  @override
  State<JournalsPage> createState() => _JournalsPageState();
}

class _JournalsPageState extends State<JournalsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppStrings.journals.tr()));
  }
}
