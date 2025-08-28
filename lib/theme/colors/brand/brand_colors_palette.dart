// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/brand/banking/banking_brand_colors_palette.dart';
import 'package:iman_uikit/theme/colors/brand/brand_colors.dart';
import 'package:iman_uikit/theme/colors/brand/fin_health/fin_health_brand_colors_palette.dart';
import 'package:iman_uikit/theme/colors/brand/installment/installment_brand_colors_palette.dart';
import 'package:iman_uikit/theme/colors/brand/invest/invest_brand_colors_palette.dart';
import 'package:iman_uikit/theme/colors/brand/payment/payment_brand_colors_palette.dart';
import 'package:iman_uikit/theme/colors/brand/super_app/super_app_brand_colors_palette.dart';

final lightBrandColors = _generatePaletteFromBrightness(Brightness.light);
final darkBrandColors = _generatePaletteFromBrightness(Brightness.dark);

BrandColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return BrandColors(
      superApp: lightSuperAppBrandColors,
      invest: lightInvestBrandColors,
      installment: lightInstallmentBrandColors,
      payment: lightPaymentBrandColors,
      banking: lightBankingBrandColors,
      finHealth: lightFinHealthBrandColors,
    );
  } else {
    return BrandColors(
      superApp: darkSuperAppBrandColors,
      invest: darkInvestBrandColors,
      installment: darkInstallmentBrandColors,
      payment: darkPaymentBrandColors,
      banking: darkBankingBrandColors,
      finHealth: darkFinHealthBrandColors,
    );
  }
}
