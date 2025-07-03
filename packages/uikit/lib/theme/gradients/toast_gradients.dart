// Flutter imports:
import 'package:flutter/material.dart';

class ToastGradients extends ThemeExtension<ToastGradients> {
  const ToastGradients({
    required this.primary,
  });

  final LinearGradient primary;

  @override
  ThemeExtension<ToastGradients> copyWith({
    LinearGradient? primary,
  }) {
    return ToastGradients(
      primary: primary ?? this.primary,
    );
  }

  @override
  ToastGradients lerp(
    covariant ThemeExtension<ToastGradients>? other,
    double t,
  ) {
    if (other == null || other is! ToastGradients) {
      return this;
    }

    return ToastGradients(
      primary: Gradient.lerp(primary, other.primary, t) as LinearGradient,
    );
  }
}
