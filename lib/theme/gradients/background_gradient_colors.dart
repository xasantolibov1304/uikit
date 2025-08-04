// Flutter imports:
import 'package:flutter/material.dart';

class BackgroundGradientColors
    extends ThemeExtension<BackgroundGradientColors> {
  const BackgroundGradientColors({
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
  ThemeExtension<BackgroundGradientColors> copyWith({
    Color? primaryStart,
    Color? primaryEnd,
    Color? secondaryStart,
    Color? secondaryEnd,
    Color? accentStart,
    Color? accentEnd,
  }) =>
      BackgroundGradientColors(
        primaryStart: primaryStart ?? this.primaryStart,
        primaryEnd: primaryEnd ?? this.primaryEnd,
        secondaryStart: secondaryStart ?? this.secondaryStart,
        secondaryEnd: secondaryEnd ?? this.secondaryEnd,
        accentStart: accentStart ?? this.accentStart,
        accentEnd: accentEnd ?? this.accentEnd,
      );

  @override
  ThemeExtension<BackgroundGradientColors> lerp(
    covariant ThemeExtension<BackgroundGradientColors>? other,
    double t,
  ) {
    if (other == null || other is! BackgroundGradientColors) {
      return this;
    }
    return BackgroundGradientColors(
      primaryStart: Color.lerp(primaryStart, other.primaryStart, t)!,
      primaryEnd: Color.lerp(primaryEnd, other.primaryEnd, t)!,
      secondaryStart: Color.lerp(secondaryStart, other.secondaryStart, t)!,
      secondaryEnd: Color.lerp(secondaryEnd, other.secondaryEnd, t)!,
      accentStart: Color.lerp(accentStart, other.accentStart, t)!,
      accentEnd: Color.lerp(accentEnd, other.accentEnd, t)!,
    );
  }
}
