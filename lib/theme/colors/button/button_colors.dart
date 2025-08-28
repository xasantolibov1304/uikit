// Flutter imports:
import 'package:flutter/material.dart';

class ButtonColors extends ThemeExtension<ButtonColors> {
  const ButtonColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.inverted,
    required this.ghost,
    required this.positive,
    required this.negative,
    required this.disabled,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color inverted;
  final Color ghost;
  final Color positive;
  final Color negative;
  final Color disabled;

  @override
  ThemeExtension<ButtonColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? inverted,
    Color? ghost,
    Color? positive,
    Color? negative,
    Color? disabled,
  }) =>
      ButtonColors(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        tertiary: tertiary ?? this.tertiary,
        inverted: inverted ?? this.inverted,
        positive: positive ?? this.positive,
        negative: negative ?? this.negative,
        ghost: ghost ?? this.ghost,
        disabled: disabled ?? this.disabled,
      );

  @override
  ThemeExtension<ButtonColors> lerp(
    covariant ThemeExtension<ButtonColors>? other,
    double t,
  ) {
    if (other == null || other is! ButtonColors) {
      return this;
    }
    return ButtonColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      inverted: Color.lerp(inverted, other.inverted, t)!,
      ghost: Color.lerp(ghost, other.ghost, t)!,
      positive: Color.lerp(positive, other.positive, t)!,
      negative: Color.lerp(negative, other.negative, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
    );
  }
}
