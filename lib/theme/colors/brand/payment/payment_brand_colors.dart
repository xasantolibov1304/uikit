// Flutter imports:
import 'package:flutter/material.dart';

class PaymentBrandColors extends ThemeExtension<PaymentBrandColors> {
  const PaymentBrandColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;

  @override
  ThemeExtension<PaymentBrandColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) =>
      PaymentBrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
      );

  @override
  ThemeExtension<PaymentBrandColors> lerp(
    covariant ThemeExtension<PaymentBrandColors>? other,
    double t,
  ) {
    if (other == null || other is! PaymentBrandColors) {
      return this;
    }
    return PaymentBrandColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
