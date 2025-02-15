import 'package:flutter/material.dart';
import 'package:globenotes/presentation/resources/color_manager.dart';
import 'package:globenotes/presentation/resources/font_manager.dart';
import 'package:globenotes/presentation/resources/styles_manager.dart';
import 'package:globenotes/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.lightBlack,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.primaryOpacity70,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorManager.grey,
    ),

    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSize.s16,
      ),
    ),

    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: ColorManager.white),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),

    textTheme: TextTheme(
      headlineLarge: getBoldStyle(color: ColorManager.lightBlack, fontSize: FontSize.s24),
      titleLarge: getSemiBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s16,
      ),
      titleMedium: getSemiBoldStyle(
        color: ColorManager.lightBlack,
        fontSize: FontSize.s16,
      ),
      bodySmall: getRegularStyle(color: ColorManager.darkGrey),
      bodyMedium: getRegularStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
    ),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(color: ColorManager.grey),
      labelStyle: getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: getRegularStyle(color: ColorManager.error),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
