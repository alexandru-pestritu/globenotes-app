import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/data/database/app_database.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AppDatabase db = instance<AppDatabase>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
          },
          child: Text(AppStrings.profile.tr()),
        ),
      ),
    );
  }
}
