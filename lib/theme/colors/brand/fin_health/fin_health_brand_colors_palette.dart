// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/brand/fin_health/fin_health_brand_colors.dart';

final lightFinHealthBrandColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkFinHealthBrandColors =
    _generatePaletteFromBrightness(Brightness.dark);

FinHealthBrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return FinHealthBrandColors(
      primary: const Color(0xFFA5E1F5),
      secondary: const Color(0xFFF5F0EB),
      tertiary: const Color(0xFFFFFACD),
    );
  } else {
    return FinHealthBrandColors(
      primary: const Color(0xFFA5E1F5),
      secondary: const Color(0xFFF5F0EB),
      tertiary: const Color(0xFFFFFACD),
    );
  }
}
