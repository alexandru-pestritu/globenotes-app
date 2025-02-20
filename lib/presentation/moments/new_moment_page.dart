import 'package:flutter/material.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';

class NewMomentPage extends StatefulWidget {
  const NewMomentPage({super.key});

  @override
  State<NewMomentPage> createState() => _NewMomentPageState();
}

class _NewMomentPageState extends State<NewMomentPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppStrings.newMoment),
    );
  }
}
