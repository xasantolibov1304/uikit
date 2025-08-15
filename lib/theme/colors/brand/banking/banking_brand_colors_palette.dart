// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/brand/banking/banking_brand_colors.dart';

final lightBankingBrandColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkBankingBrandColors = _generatePaletteFromBrightness(Brightness.dark);

BankingBrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return BankingBrandColors(
      primary: const Color(0xFFFFA05F),
      secondary: const Color(0xFFFFBE73),
      tertiary: const Color(0xFFFFFACD),
    );
  } else {
    return BankingBrandColors(
      primary: const Color(0xFFFFA05F),
      secondary: const Color(0xFFFFBE73),
      tertiary: const Color(0xFFFFFACD),
    );
  }
}
