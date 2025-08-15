// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/brand/payment/payment_brand_colors.dart';

final lightPaymentBrandColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkPaymentBrandColors = _generatePaletteFromBrightness(Brightness.dark);

PaymentBrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return PaymentBrandColors(
      primary: const Color(0xFFFAE6E6),
      secondary: const Color(0xFFF5F0EB),
      tertiary: const Color(0xFFFFFACD),
    );
  } else {
    return PaymentBrandColors(
      primary: const Color(0xFFFAE6E6),
      secondary: const Color(0xFFF5F0EB),
      tertiary: const Color(0xFFFFFACD),
    );
  }
}
