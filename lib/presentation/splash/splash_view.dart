import 'dart:async';
import 'package:flutter/material.dart';
import 'package:globenotes/app/app_preferences.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/resources/assets_manager.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(Duration(seconds: 2), _goNext);
  }

  _goNext() async {
    bool isUserLoggedIn = await _appPreferences.isUserLoggedIn();
    if (!mounted) return;

    if (isUserLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      bool isOnBoardingScreenViewed =
          await _appPreferences.isOnBoardingScreenViewed();
      if (!mounted) return;

      if (isOnBoardingScreenViewed) {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      } else {
        Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}
