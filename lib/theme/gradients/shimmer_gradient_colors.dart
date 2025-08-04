// Flutter imports:
import 'package:flutter/material.dart';

class ShimmerGradientColors extends ThemeExtension<ShimmerGradientColors> {
  const ShimmerGradientColors({
    required this.primaryStart,
    required this.primaryCenter,
    required this.primaryEnd,
    required this.secondaryStart,
    required this.secondaryCenter,
    required this.secondaryEnd,
  });

  final Color primaryStart;
  final Color primaryCenter;
  final Color primaryEnd;

  final Color secondaryStart;
  final Color secondaryCenter;
  final Color secondaryEnd;

  @override
  ThemeExtension<ShimmerGradientColors> copyWith({
    Color? primaryStart,
    Color? primaryCenter,
    Color? primaryEnd,
    Color? secondaryStart,
    Color? secondaryCenter,
    Color? secondaryEnd,
  }) =>
      ShimmerGradientColors(
        primaryStart: primaryStart ?? this.primaryStart,
        primaryCenter: primaryCenter ?? this.primaryCenter,
        primaryEnd: primaryEnd ?? this.primaryEnd,
        secondaryStart: primaryStart ?? this.secondaryStart,
        secondaryCenter: primaryCenter ?? this.secondaryCenter,
        secondaryEnd: primaryEnd ?? this.secondaryEnd,
      );

  @override
  ThemeExtension<ShimmerGradientColors> lerp(
    covariant ThemeExtension<ShimmerGradientColors>? other,
    double t,
  ) {
    if (other == null || other is! ShimmerGradientColors) {
      return this;
    }
    return ShimmerGradientColors(
      primaryStart: Color.lerp(primaryStart, other.primaryStart, t)!,
      primaryCenter: Color.lerp(primaryCenter, other.primaryCenter, t)!,
      primaryEnd: Color.lerp(primaryEnd, other.primaryEnd, t)!,
      secondaryStart: Color.lerp(primaryStart, other.primaryStart, t)!,
      secondaryCenter: Color.lerp(primaryCenter, other.primaryCenter, t)!,
      secondaryEnd: Color.lerp(primaryEnd, other.primaryEnd, t)!,
    );
  }
}
