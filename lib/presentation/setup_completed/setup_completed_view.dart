import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

class SetupCompletedView extends StatefulWidget {
  const SetupCompletedView({super.key});

  @override
  State<SetupCompletedView> createState() => _SetupCompletedViewState();
}

class _SetupCompletedViewState extends State<SetupCompletedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:
            Theme.of(context).brightness == Brightness.dark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p28),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: Center(
                    child: SvgPicture.asset(
                      ImageAssets.setupCompletedIllustration,
                      width: AppSize.s300,
                      height: AppSize.s150,
                    ),
                  ),
                ),
                Text(
                  AppStrings.youReAllSet.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: AppSize.s15),
                const SizedBox(height: AppSize.s30),
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s45,
                  child: ElevatedButton(
                    onPressed:
                        () => Navigator.pushReplacementNamed(
                          context,
                          Routes.mainRoute,
                        ),
                    child: Text(AppStrings.letsBegin.tr()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
