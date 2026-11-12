// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/brand/invest/invest_brand_colors.dart';

final lightInvestBrandColors = _generatePaletteFromBrightness(Brightness.light);
final darkInvestBrandColors = _generatePaletteFromBrightness(Brightness.dark);

InvestBrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return InvestBrandColors(
      primary: const Color(0xFF0A1A3C),
      secondary: const Color(0xFF0F3769),
      tertiary: const Color(0xFFFFA05F),
    );
  } else {
    return InvestBrandColors(
      primary: const Color(0xFF0A1A3C),
      secondary: const Color(0xFF0F3769),
      tertiary: const Color(0xFFFFA05F),
    );
  }
}
