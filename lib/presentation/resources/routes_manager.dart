import 'package:flutter/material.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/presentation/forgot_password/forgot_password.dart';
import 'package:globenotes/presentation/home/home.dart';
import 'package:globenotes/presentation/login/login_view.dart';
import 'package:globenotes/presentation/onboarding/onboarding_view.dart';
import 'package:globenotes/presentation/register/register.dart';
import 'package:globenotes/presentation/reset_password/reset_password.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/splash/splash.dart';
import 'package:globenotes/presentation/verify_email/verify_email.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String verifyEmailRoute = "/verifyEmail";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String resetPasswordRoute = "/resetPassword";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.verifyEmailRoute:
        return MaterialPageRoute(builder: (_) => VerifyEmailView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.resetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: Text(AppStrings.noRouteFound)),
            body: Center(child: Text(AppStrings.noRouteFound)),
          ),
    );
  }
}
