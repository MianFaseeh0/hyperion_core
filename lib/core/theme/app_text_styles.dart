import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // ==================== Headings ====================
  static double multiplier = 0.8;
  static String package = 'holaride_core';
  static String fontFamily = 'Poppins';
  static TextStyle headline1 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static TextStyle headline2 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 28,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  static TextStyle headline3 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 24,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline4 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle headline5 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle headline6 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 18,
    fontWeight: FontWeight.w500,
  );

  // ==================== Titles / Subtitles ====================
  static TextStyle title = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 20,
    fontWeight: FontWeight.w500,
  );

  static TextStyle titleBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitle1 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 18,
    fontWeight: FontWeight.w500,
  );

  static TextStyle subtitle2 = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle subtitle2Bold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w600,
  );

  // ==================== Body Text ====================
  static TextStyle bodyLarge = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 18,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle bodyLargeBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 18,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle bodyLargeSemiBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 18,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle body = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  static TextStyle bodyCaption = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    height: 1.5,
  );

  static TextStyle bodyBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  static TextStyle bodySemiBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
  );

  static TextStyle bodyMedium = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static TextStyle bodySmall = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle bodySmallBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.bold,
    height: 1.4,
  );

  static TextStyle bodySmallSemiBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static TextStyle bodySmallMedium = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  // ==================== Captions / Labels ====================
  static TextStyle caption = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
    height: 1.3,
  );

  static TextStyle captionBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
    height: 1.3,
  );

  static TextStyle captionSemiBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
    height: 1.3,
  );

  static TextStyle captionMedium = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    height: 1.3,
  );

  static TextStyle label = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelSmall = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle labelSmallBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.bold,
  );

  // ==================== Overline / Tiny Text ====================
  static TextStyle overline = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5,
  );

  static TextStyle overlineBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 10,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );

  static TextStyle tiny = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 10,
    fontWeight: FontWeight.w400,
  );

  static TextStyle tinyBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 10,
    fontWeight: FontWeight.bold,
  );

  // ==================== Buttons ====================
  static TextStyle button = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle buttonLarge = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle buttonSmall = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  static TextStyle buttonBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  // ==================== Links ====================
  static TextStyle link = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  static TextStyle linkBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
  );

  static TextStyle linkSmall = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
  );

  // ==================== Display / Hero Text ====================
  static TextStyle display = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 48,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.0,
  );

  static TextStyle displayMedium = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 40,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.8,
  );

  static TextStyle displaySmall = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 36,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  // ==================== Error / Helper Text ====================
  static TextStyle error = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.w400,
    color: Colors.red,
  );

  static TextStyle errorBold = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );

  static TextStyle helper = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  // ==================== Placeholder / Hint ====================
  static TextStyle placeholder = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle hint = TextStyle(
    package: package,
    fontFamily: fontFamily,
    fontSize: multiplier * 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}