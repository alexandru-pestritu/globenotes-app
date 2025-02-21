import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#E81948");
  static Color primaryOpacity70 = HexColor.fromHex("#B3E81948");
  static Color primaryOpacity20 = HexColor.fromHex("#fad1da");
  static Color primaryOpacity10 = HexColor.fromHex("#fde8ed");
  static Color darkWhite = HexColor.fromHex("#FDFDFD");
  static Color lightBlack = HexColor.fromHex("#2A2A2A");
  static Color darkGrey = HexColor.fromHex("#696969");
  static Color grey = HexColor.fromHex("#9D9D9D");
  static Color lightGrey = HexColor.fromHex("#D1D1D1");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString";
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
