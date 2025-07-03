// Flutter imports:
import 'package:flutter/material.dart';

class StatusColors extends ThemeExtension<StatusColors> {
  const StatusColors({
    required this.info,
    required this.error,
    required this.warning,
    required this.success,
  });

  final Color info;
  final Color error;
  final Color warning;
  final Color success;

  @override
  ThemeExtension<StatusColors> copyWith({
    Color? info,
    Color? error,
    Color? warning,
    Color? success,
  }) =>
      StatusColors(
        info: info ?? this.info,
        error: error ?? this.error,
        warning: warning ?? this.warning,
        success: success ?? this.success,
      );

  @override
  ThemeExtension<StatusColors> lerp(
    covariant ThemeExtension<StatusColors>? other,
    double t,
  ) {
    if (other == null || other is! StatusColors) {
      return this;
    }
    return StatusColors(
      info: Color.lerp(info, other.info, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}
