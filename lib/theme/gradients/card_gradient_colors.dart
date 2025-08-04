// Flutter imports:
import 'package:flutter/material.dart';

class CardGradientColors extends ThemeExtension<CardGradientColors> {
  const CardGradientColors({
    required this.primaryStart,
    required this.primaryEnd,
    required this.secondaryStart,
    required this.secondaryEnd,
    required this.accentStart,
    required this.accentEnd,
  });

  final Color primaryStart;
  final Color primaryEnd;
  final Color secondaryStart;
  final Color secondaryEnd;
  final Color accentStart;
  final Color accentEnd;

  @override
  ThemeExtension<CardGradientColors> copyWith({
    Color? primaryStart,
    Color? primaryEnd,
    Color? secondaryStart,
    Color? secondaryEnd,
    Color? accentStart,
    Color? accentEnd,
  }) =>
      CardGradientColors(
        primaryStart: primaryStart ?? this.primaryStart,
        primaryEnd: primaryEnd ?? this.primaryEnd,
        secondaryStart: secondaryStart ?? this.secondaryStart,
        secondaryEnd: secondaryEnd ?? this.secondaryEnd,
        accentStart: accentStart ?? this.accentStart,
        accentEnd: accentEnd ?? this.accentEnd,
      );

  @override
  ThemeExtension<CardGradientColors> lerp(
    covariant ThemeExtension<CardGradientColors>? other,
    double t,
  ) {
    if (other == null || other is! CardGradientColors) {
      return this;
    }
    return CardGradientColors(
      primaryStart: Color.lerp(primaryStart, other.primaryStart, t)!,
      primaryEnd: Color.lerp(primaryEnd, other.primaryEnd, t)!,
      secondaryStart: Color.lerp(secondaryStart, other.secondaryStart, t)!,
      secondaryEnd: Color.lerp(secondaryEnd, other.secondaryEnd, t)!,
      accentStart: Color.lerp(accentStart, other.accentStart, t)!,
      accentEnd: Color.lerp(accentEnd, other.accentEnd, t)!,
    );
  }
}
