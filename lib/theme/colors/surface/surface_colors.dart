// Flutter imports:
import 'package:flutter/material.dart';

class SurfaceColors extends ThemeExtension<SurfaceColors> {
  const SurfaceColors({
    required this.primary,
    required this.secondary,
    required this.elevated,
    required this.tertiary,
    required this.grey,
    required this.muted,
    required this.dark,
    required this.info,
    required this.error,
    required this.warning,
    required this.success,
  });

  final Color primary;
  final Color secondary;
  final Color elevated;
  final Color tertiary;
  final Color grey;
  final Color muted;
  final Color dark;
  final Color info;
  final Color error;
  final Color warning;
  final Color success;

  @override
  ThemeExtension<SurfaceColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? elevated,
    Color? tertiary,
    Color? grey,
    Color? muted,
    Color? dark,
    Color? info,
    Color? error,
    Color? warning,
    Color? success,
  }) =>
      SurfaceColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        elevated: elevated ?? this.elevated,
        tertiary: tertiary ?? this.tertiary,
        grey: grey ?? this.grey,
        muted: muted ?? this.muted,
        dark: dark ?? this.dark,
        info: info ?? this.info,
        error: error ?? this.error,
        warning: warning ?? this.warning,
        success: success ?? this.success,
      );

  @override
  ThemeExtension<SurfaceColors> lerp(
    covariant ThemeExtension<SurfaceColors>? other,
    double t,
  ) {
    if (other == null || other is! SurfaceColors) {
      return this;
    }
    return SurfaceColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      elevated: Color.lerp(elevated, other.elevated, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      info: Color.lerp(info, other.info, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}
