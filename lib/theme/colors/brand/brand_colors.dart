// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/brand/banking/banking_brand_colors.dart';
import 'package:iman_uikit/theme/colors/brand/fin_health/fin_health_brand_colors.dart';
import 'package:iman_uikit/theme/colors/brand/installment/installment_brand_colors.dart';
import 'package:iman_uikit/theme/colors/brand/invest/invest_brand_colors.dart';
import 'package:iman_uikit/theme/colors/brand/payment/payment_brand_colors.dart';

// Export all brand color classes
export 'invest/invest_brand_colors.dart';
export 'installment/installment_brand_colors.dart';
export 'payment/payment_brand_colors.dart';
export 'banking/banking_brand_colors.dart';
export 'fin_health/fin_health_brand_colors.dart';

class BrandColors extends ThemeExtension<BrandColors> {
  const BrandColors({
    required this.invest,
    required this.installment,
    required this.payment,
    required this.banking,
    required this.finHealth,
  });

  final InvestBrandColors invest;
  final InstallmentBrandColors installment;
  final PaymentBrandColors payment;
  final BankingBrandColors banking;
  final FinHealthBrandColors finHealth;

  @override
  ThemeExtension<BrandColors> copyWith({
    InvestBrandColors? invest,
    InstallmentBrandColors? installment,
    PaymentBrandColors? payment,
    BankingBrandColors? banking,
    FinHealthBrandColors? finHealth,
  }) =>
      BrandColors(
        invest: invest ?? this.invest,
        installment: installment ?? this.installment,
        payment: payment ?? this.payment,
        banking: banking ?? this.banking,
        finHealth: finHealth ?? this.finHealth,
      );

  @override
  ThemeExtension<BrandColors> lerp(
    covariant ThemeExtension<BrandColors>? other,
    double t,
  ) {
    if (other == null || other is! BrandColors) {
      return this;
    }
    return BrandColors(
      invest: invest.lerp(other.invest, t) as InvestBrandColors,
      installment:
          installment.lerp(other.installment, t) as InstallmentBrandColors,
      payment: payment.lerp(other.payment, t) as PaymentBrandColors,
      banking: banking.lerp(other.banking, t) as BankingBrandColors,
      finHealth: finHealth.lerp(other.finHealth, t) as FinHealthBrandColors,
    );
  }
}
