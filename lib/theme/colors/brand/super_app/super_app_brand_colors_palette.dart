// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/brand/super_app/super_app_brand_colors.dart';

final lightSuperAppBrandColors =
_generatePaletteFromBrightness(Brightness.light);
final darkSuperAppBrandColors = _generatePaletteFromBrightness(Brightness.dark);

SuperAppBrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return SuperAppBrandColors(
      primary: const Color(0xFF222222),
      secondary: const Color(0xFF4d4d4d),
      tertiary: const Color(0xFF6c6c6c),
      transparent: Color(0x1A222222),
    );
  } else {
    return SuperAppBrandColors(
      primary: const Color(0xFF222222),
      secondary: const Color(0xFF4d4d4d),
      tertiary: const Color(0xFF6c6c6c),
      transparent: Color(0x1A222222),
    );
  }
}
