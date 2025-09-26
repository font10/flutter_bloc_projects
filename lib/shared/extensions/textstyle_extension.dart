import 'package:flutter/material.dart';

import 'color_extension.dart';

extension TextStyleExtension on TextStyle {

  static TextStyle get displayLarge => const TextStyle(
      fontSize: 57,
      height: 64 / 57,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get displayMedium => const TextStyle(
      fontSize: 45,
      height: 52 / 45,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get displaySmall => const TextStyle(
      fontSize: 36,
      height: 44 / 36,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  // Headline
  static TextStyle get headlineLarge => const TextStyle(
      fontSize: 32,
      height: 40 / 32,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get headlineMedium => const TextStyle(
      fontSize: 28,
      height: 36 / 28,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get headlineSmall => const TextStyle(
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  // Title
  static TextStyle get titleLarge => const TextStyle(
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: 0,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get titleMedium => const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get titleSmall => const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
      color: Colors.black);

  // Label
  static TextStyle get labelLarge => const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get labelMedium => const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get labelSmall => const TextStyle(
      fontSize: 11,
      height: 16 / 11,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w500,
      fontFamily: 'OpenSans',
      color: Colors.black);

  // Body
  static TextStyle get bodyLarge => const TextStyle(
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get bodyMedium => const TextStyle(
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);

  static TextStyle get bodySmall => const TextStyle(
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
      fontFamily: 'OpenSans',
      color: Colors.black);
}
