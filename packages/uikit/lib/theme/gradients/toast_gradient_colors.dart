// Flutter imports:
import 'package:flutter/material.dart';

class ToastGradientColors extends ThemeExtension<ToastGradientColors> {
  const ToastGradientColors({
    required this.grayStart,
    required this.grayEnd,
  });

  final Color grayStart;
  final Color grayEnd;

  @override
  ThemeExtension<ToastGradientColors> copyWith({
    Color? grayStart,
    Color? grayEnd,
  }) =>
      ToastGradientColors(
        grayStart: grayStart ?? this.grayStart,
        grayEnd: grayEnd ?? this.grayEnd,
      );

  @override
  ThemeExtension<ToastGradientColors> lerp(
    covariant ThemeExtension<ToastGradientColors>? other,
    double t,
  ) {
    if (other == null || other is! ToastGradientColors) {
      return this;
    }
    return ToastGradientColors(
      grayStart: Color.lerp(grayStart, other.grayStart, t)!,
      grayEnd: Color.lerp(grayEnd, other.grayEnd, t)!,
    );
  }
}
