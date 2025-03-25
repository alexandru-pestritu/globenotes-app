import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:globenotes/app/di.dart';
import 'package:globenotes/app/extensions.dart';
import 'package:globenotes/presentation/forgot_password/forgot_password_view.dart';
import 'package:globenotes/presentation/initial_sync/initial_sync_view.dart';
import 'package:globenotes/presentation/main/main_view.dart';
import 'package:globenotes/presentation/login/login_view.dart';
import 'package:globenotes/presentation/onboarding/onboarding_view.dart';
import 'package:globenotes/presentation/register/register_view.dart';
import 'package:globenotes/presentation/reset_password/reset_password_view.dart';
import 'package:globenotes/presentation/resources/strings_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';
import 'package:globenotes/presentation/settings/app_settings/app_settings_view.dart';
import 'package:globenotes/presentation/settings/language_selection/language_selection_view.dart';
import 'package:globenotes/presentation/setup_completed/setup_completed_view.dart';
import 'package:globenotes/presentation/splash/splash_view.dart';
import 'package:globenotes/presentation/verify_email/verify_email_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String verifyEmailRoute = "/verifyEmail";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String resetPasswordRoute = "/resetPassword";
  static const String initialSyncRoute = "/initialSync";
  static const String setupCompletedRoute = "/setupCompleted";
  static const String mainRoute = "/main";
  static const String languageSelectionRoute = "/languageSelection";
  static const String appSettingsRoute = "/appSettings";
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
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.verifyEmailRoute:
        initVerifyEmailModule();
        final args = routeSettings.arguments;
        if (args != null && args is Map<String, dynamic>) {
          final email = args[RouteParameter.email] ?? empty;
          final flow = args[RouteParameter.flow] ?? empty;
          return MaterialPageRoute(
            builder: (_) => VerifyEmailView(email: email, flow: flow),
          );
        } else {
          return unDefinedRoute();
        }
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.resetPasswordRoute:
        initResetPasswordModule();
        final args = routeSettings.arguments;
        if (args != null && args is Map<String, dynamic>) {
          final email = args[RouteParameter.email] ?? empty;
          final code = args[RouteParameter.code] ?? empty;
          return MaterialPageRoute(
            builder: (_) => ResetPasswordView(email: email, code: code),
          );
        } else {
          return unDefinedRoute();
        }
      case Routes.initialSyncRoute:
        initInitialSyncModule();
        return MaterialPageRoute(builder: (_) => InitialSyncView());
      case Routes.mainRoute:
        initProfileModule();
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.setupCompletedRoute:
        return MaterialPageRoute(builder: (_) => SetupCompletedView());
      case Routes.languageSelectionRoute:
        initLanguageSelectionModule();
        return MaterialPageRoute(builder: (_) => LanguageSelectionView());
      case Routes.appSettingsRoute:
        initAppSettingsModule();
        return MaterialPageRoute(builder: (_) => AppSettingsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: Text(AppStrings.noRouteFound.tr())),
            body: Center(child: Text(AppStrings.noRouteFound.tr())),
          ),
    );
  }
}
