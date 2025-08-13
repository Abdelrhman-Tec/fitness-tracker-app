import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors
  static const Color primaryBrand = Color(0xFF9263FD);
  static const Color secondaryBrand = Color(0xFF9DCEFF);

  // Secondary Colors
  static const Color secondary1 = Color(0xFFC58BF2);
  static const Color secondary2 = Color(0xFFEEA4CE);

  // Black Color
  static const Color black = Color(0xFF1D1617);

  // White Color
  static const Color white = Color(0xFFFFFFFF);

  // Gray Colors
  static const Color gray1 = Color(0xFF786F72);
  static const Color gray2 = Color(0xFFADA4A5);
  static const Color gray3 = Color(0xFFDDDADA);
  static const Color gray4 = Color(0xFFF7F8F8);

  // Border Colors
  static const Color border = Color(0xFFF7F8F8);

  static const Color bluePurpleLight = Color(0xFF92A3FD);
  // Gradients
  static LinearGradient primaryGradient = LinearGradient(
    colors: [secondaryBrand, const Color.fromARGB(255, 131, 129, 255)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary1, secondary2],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static LinearGradient purpleToPinkGradient = LinearGradient(
    colors: [primaryBrand, secondary2],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient blueToPurpleGradient = LinearGradient(
    colors: [secondaryBrand, primaryBrand],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient blueToLinerGradient = const LinearGradient(
    colors: [secondaryBrand, bluePurpleLight],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
