import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xff673ab7),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorSchemeSeed: const Color(0xff673ab7),
  );
}

TextStyle get titleStyle => GoogleFonts.roboto(
      textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
