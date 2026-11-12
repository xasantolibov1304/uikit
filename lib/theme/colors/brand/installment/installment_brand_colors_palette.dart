// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/brand/installment/installment_brand_colors.dart';

final lightInstallmentBrandColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkInstallmentBrandColors =
    _generatePaletteFromBrightness(Brightness.dark);

InstallmentBrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return InstallmentBrandColors(
      primary: const Color(0xFFFF6969),
      secondary: const Color(0xFFFFA05F),
      tertiary: const Color(0xFFFFBE73),
    );
  } else {
    return InstallmentBrandColors(
      primary: const Color(0xFFFF6969),
      secondary: const Color(0xFFFFA05F),
      tertiary: const Color(0xFFFFBE73),
    );
  }
}
