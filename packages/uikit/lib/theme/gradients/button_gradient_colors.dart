// Flutter imports:
import 'package:flutter/material.dart';

class ButtonGradientColors extends ThemeExtension<ButtonGradientColors> {
  const ButtonGradientColors({
    required this.primaryStart,
    required this.primaryEnd,
    required this.secondaryStart,
    required this.secondaryEnd,
    required this.successStart,
    required this.successEnd,
  });

  final Color primaryStart;
  final Color primaryEnd;
  final Color secondaryStart;
  final Color secondaryEnd;
  final Color successStart;
  final Color successEnd;

  @override
  ThemeExtension<ButtonGradientColors> copyWith({
    Color? primaryStart,
    Color? primaryEnd,
    Color? secondaryStart,
    Color? secondaryEnd,
    Color? successStart,
    Color? successEnd,
  }) =>
      ButtonGradientColors(
        primaryStart: primaryStart ?? this.primaryStart,
        primaryEnd: primaryEnd ?? this.primaryEnd,
        secondaryStart: secondaryStart ?? this.secondaryStart,
        secondaryEnd: secondaryEnd ?? this.secondaryEnd,
        successStart: successStart ?? this.successStart,
        successEnd: successEnd ?? this.successEnd,
      );

  @override
  ThemeExtension<ButtonGradientColors> lerp(
    covariant ThemeExtension<ButtonGradientColors>? other,
    double t,
  ) {
    if (other == null || other is! ButtonGradientColors) {
      return this;
    }
    return ButtonGradientColors(
      primaryStart: Color.lerp(primaryStart, other.primaryStart, t)!,
      primaryEnd: Color.lerp(primaryEnd, other.primaryEnd, t)!,
      secondaryStart: Color.lerp(secondaryStart, other.secondaryStart, t)!,
      secondaryEnd: Color.lerp(secondaryEnd, other.secondaryEnd, t)!,
      successStart: Color.lerp(successStart, other.successStart, t)!,
      successEnd: Color.lerp(successEnd, other.successEnd, t)!,
    );
  }
}
