// Flutter imports:
import 'package:flutter/material.dart';

class BorderColors extends ThemeExtension<BorderColors> {
  const BorderColors({
    required this.primary,
    required this.secondary,
    required this.muted,
    required this.info,
    required this.error,
    required this.warning,
    required this.success,
    required this.invert,
  });

  final Color primary;
  final Color secondary;
  final Color muted;
  final Color info;
  final Color error;
  final Color warning;
  final Color success;
  final Color invert;

  @override
  ThemeExtension<BorderColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? muted,
    Color? info,
    Color? error,
    Color? warning,
    Color? success,
    Color? invert,
  }) =>
      BorderColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        muted: muted ?? this.muted,
        info: info ?? this.info,
        error: error ?? this.error,
        warning: warning ?? this.warning,
        success: success ?? this.success,
        invert: invert ?? this.invert,
      );

  @override
  ThemeExtension<BorderColors> lerp(
    covariant ThemeExtension<BorderColors>? other,
    double t,
  ) {
    if (other == null || other is! BorderColors) {
      return this;
    }
    return BorderColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      info: Color.lerp(info, other.info, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
      invert: Color.lerp(invert, other.invert, t)!,
    );
  }
}
