import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

ThemeData getApplicationLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.lightBlack,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.primaryOpacity70,
    scaffoldBackgroundColor: ColorManager.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
      brightness: Brightness.light,
    ),

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    appBarTheme: AppBarTheme(
      foregroundColor: ColorManager.lightBlack,
      centerTitle: true,
      color: ColorManager.white,
      elevation: AppSize.s0,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),

    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(
          fontSize: FontSize.s16,
          color: ColorManager.white,
        ),
        foregroundColor: ColorManager.white,
        backgroundColor: ColorManager.primary,
        disabledBackgroundColor: ColorManager.primaryOpacity20,
        disabledForegroundColor: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: getBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s24,
      ),
      headlineMedium: getBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s20,
      ),
      headlineSmall: getBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s18,
      ),

      titleLarge: getSemiBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s18,
      ),
      titleMedium: getSemiBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s16,
      ),
      titleSmall: getMediumStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s14,
      ),

      bodyLarge: getRegularStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s16,
      ),
      bodyMedium: getMediumStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s12,
      ),

      labelLarge: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      labelMedium: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s14,
      ),
      labelSmall: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s12,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.only(
        left: AppPadding.p16,
        right: AppPadding.p8,
        top: AppPadding.p8,
        bottom: AppPadding.p8,
      ),
      hintStyle: getRegularStyle(
        fontSize: FontSize.s14,
        color: ColorManager.grey,
      ),
      labelStyle: getMediumStyle(
        fontSize: FontSize.s14,
        color: ColorManager.darkGrey,
      ),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightGrey,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightBlack,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
    ),
    fontFamily: FontConstants.fontFamily,
    iconTheme: IconThemeData(color: ColorManager.lightBlack),
  );
}

ThemeData getApplicationDarkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.grey,
    scaffoldBackgroundColor: Colors.grey[900],
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
      brightness: Brightness.dark,
    ),

    cardTheme: CardTheme(
      color: Colors.grey[900],
      shadowColor: Colors.black54,
      elevation: AppSize.s4,
    ),

    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      centerTitle: true,
      color: Colors.grey[900],
      elevation: AppSize.s4,
      shadowColor: Colors.black54,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getSemiBoldStyle(
          fontSize: FontSize.s16,
          color: ColorManager.white,
        ),
        backgroundColor: ColorManager.primary,
        foregroundColor: ColorManager.white,
        disabledBackgroundColor: ColorManager.lightBlack,
        disabledForegroundColor: ColorManager.darkGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s24,
      ),
      headlineMedium: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s20,
      ),
      headlineSmall: getBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s18,
      ),

      titleLarge: getSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s18,
      ),
      titleMedium: getSemiBoldStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      titleSmall: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s14,
      ),

      bodyLarge: getRegularStyle(
        color: Colors.grey[300]!,
        fontSize: FontSize.s16,
      ),
      bodyMedium: getMediumStyle(
        color: ColorManager.grey,
        fontSize: FontSize.s14,
      ),
      bodySmall: getRegularStyle(
        color: Colors.grey[500]!,
        fontSize: FontSize.s12,
      ),

      labelLarge: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
      labelMedium: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s14,
      ),
      labelSmall: getMediumStyle(
        color: ColorManager.white,
        fontSize: FontSize.s12,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.only(
        left: AppPadding.p16,
        right: AppPadding.p8,
        top: AppPadding.p8,
        bottom: AppPadding.p8,
      ),
      hintStyle: getRegularStyle(
        fontSize: FontSize.s14,
        color: Colors.grey[500]!,
      ),
      labelStyle: getMediumStyle(
        fontSize: FontSize.s14,
        color: Colors.grey[300]!,
      ),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[700]!, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[700]!, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[700]!, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.lightBlack,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s15)),
      ),
    ),
    fontFamily: FontConstants.fontFamily,
    iconTheme: IconThemeData(color: ColorManager.white),
  );
}
