// Dart imports:
import 'dart:ui' show lerpDouble;

// Flutter imports:
import 'package:flutter/material.dart';

/// Corner radius tokens used by all uikit components.
///
/// Apps override only the tokens that differ:
/// ```dart
/// UikitTheme.light(radii: const UikitRadii(xl: 12, lg: 8));
/// ```
class UikitRadii extends ThemeExtension<UikitRadii> {
  const UikitRadii({
    this.xs = 2,
    this.sm = 4,
    this.md = 8,
    this.lg = 12,
    this.xl = 16,
    this.full = 100,
  });

  /// Thin bars, segment indicators.
  final double xs;

  /// Progress bars, small indicators.
  final double sm;

  /// Tabs, small controls, uploads.
  final double md;

  /// Small buttons, badges, dropdowns, snackbars, tooltips.
  final double lg;

  /// Cards, inputs, large buttons, sheets, dialogs, alerts.
  final double xl;

  /// Pill / fully rounded shapes.
  final double full;

  @override
  UikitRadii copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? full,
  }) {
    return UikitRadii(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      full: full ?? this.full,
    );
  }

  @override
  UikitRadii lerp(covariant ThemeExtension<UikitRadii>? other, double t) {
    if (other is! UikitRadii) {
      return this;
    }
    return UikitRadii(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      full: lerpDouble(full, other.full, t)!,
    );
  }
}

extension UikitRadiiThemeDataExtension on ThemeData {
  UikitRadii get radii => extension<UikitRadii>() ?? const UikitRadii();
}

extension UikitRadiiContextExtension on BuildContext {
  UikitRadii get radii => Theme.of(this).radii;
}
