// Flutter imports:
import 'package:flutter/material.dart';

class BankingBrandColors extends ThemeExtension<BankingBrandColors> {
  const BankingBrandColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;

  @override
  ThemeExtension<BankingBrandColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
  }) =>
      BankingBrandColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
      );

  @override
  ThemeExtension<BankingBrandColors> lerp(
    covariant ThemeExtension<BankingBrandColors>? other,
    double t,
  ) {
    if (other == null || other is! BankingBrandColors) {
      return this;
    }
    return BankingBrandColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
    );
  }
}
