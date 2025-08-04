// Flutter imports:
import 'package:flutter/material.dart';

class ButtonColors extends ThemeExtension<ButtonColors> {
  const ButtonColors({
    required this.primary,
    required this.primaryPressed,
    required this.primaryHover,
    required this.primaryDisable,
    required this.secondary,
    required this.secondaryHover,
    required this.secondaryPressed,
    required this.secondaryDisable,
    required this.tertiary,
    required this.tertiaryHover,
    required this.tertiaryPressed,
    required this.tertiaryDisable,
    required this.inverted,
    required this.invertedHover,
    required this.invertedPressed,
    required this.invertedDisable,
    required this.ghost,
    required this.ghostHover,
    required this.ghostPressed,
    required this.ghostDisable,
    required this.positive,
    required this.positiveHover,
    required this.positivePressed,
    required this.positiveDisable,
    required this.negative,
    required this.negativeHover,
    required this.negativePressed,
    required this.negativeDisable,
  });

  final Color primary;
  final Color primaryHover;
  final Color primaryPressed;
  final Color primaryDisable;

  final Color secondary;
  final Color secondaryHover;
  final Color secondaryPressed;
  final Color secondaryDisable;

  final Color tertiary;
  final Color tertiaryHover;
  final Color tertiaryPressed;
  final Color tertiaryDisable;

  final Color inverted;
  final Color invertedHover;
  final Color invertedPressed;
  final Color invertedDisable;

  final Color ghost;
  final Color ghostHover;
  final Color ghostPressed;
  final Color ghostDisable;

  final Color positive;
  final Color positiveHover;
  final Color positivePressed;
  final Color positiveDisable;

  final Color negative;
  final Color negativeHover;
  final Color negativePressed;
  final Color negativeDisable;

  @override
  ThemeExtension<ButtonColors> copyWith({
    Color? primary,
    Color? primaryHover,
    Color? primaryPressed,
    Color? primaryDisable,
    Color? secondary,
    Color? secondaryHover,
    Color? secondaryPressed,
    Color? secondaryDisable,
    Color? tertiary,
    Color? tertiaryHover,
    Color? tertiaryPressed,
    Color? tertiaryDisable,
    Color? inverted,
    Color? invertedHover,
    Color? invertedPressed,
    Color? invertedDisable,
    Color? ghost,
    Color? ghostHover,
    Color? ghostPressed,
    Color? ghostDisable,
    Color? positive,
    Color? positivePressed,
    Color? positiveHover,
    Color? positiveDisable,
    Color? negative,
    Color? negativePressed,
    Color? negativeHover,
    Color? negativeDisable,
  }) =>
      ButtonColors(
        primary: primary ?? this.primary,
        primaryHover: primaryHover ?? this.primaryHover,
        primaryPressed: primaryPressed ?? this.primaryPressed,
        primaryDisable: primaryDisable ?? this.primaryDisable,
        secondary: secondary ?? this.secondary,
        secondaryPressed: secondaryPressed ?? this.secondaryPressed,
        secondaryHover: secondaryHover ?? this.secondaryHover,
        secondaryDisable: secondaryDisable ?? this.secondaryDisable,
        tertiary: tertiary ?? this.tertiary,
        tertiaryPressed: tertiaryPressed ?? this.tertiaryPressed,
        tertiaryHover: tertiaryHover ?? this.tertiaryHover,
        tertiaryDisable: tertiaryDisable ?? this.tertiaryDisable,
        inverted: inverted ?? this.inverted,
        invertedPressed: invertedPressed ?? this.invertedPressed,
        invertedHover: invertedHover ?? this.invertedHover,
        invertedDisable: invertedDisable ?? this.invertedDisable,
        positive: positive ?? this.positive,
        positivePressed: positivePressed ?? this.positivePressed,
        positiveHover: positiveHover ?? this.positiveHover,
        positiveDisable: positiveDisable ?? this.positiveDisable,
        negative: negative ?? this.negative,
        negativePressed: negativePressed ?? this.negativePressed,
        negativeHover: negativeHover ?? this.negativeHover,
        negativeDisable: negativeDisable ?? this.negativeDisable,
        ghost: ghost ?? this.ghost,
        ghostPressed: ghostPressed ?? this.ghostPressed,
        ghostHover: ghostHover ?? this.ghostHover,
        ghostDisable: ghostDisable ?? this.ghostDisable,
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
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      primaryPressed: Color.lerp(primaryPressed, other.primaryPressed, t)!,
      primaryDisable: Color.lerp(primaryDisable, other.primaryDisable, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryPressed:
          Color.lerp(secondaryPressed, other.secondaryPressed, t)!,
      secondaryHover: Color.lerp(secondaryHover, other.secondaryHover, t)!,
      secondaryDisable:
          Color.lerp(secondaryDisable, other.secondaryDisable, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      tertiaryPressed: Color.lerp(tertiaryPressed, other.tertiaryPressed, t)!,
      tertiaryHover: Color.lerp(tertiaryHover, other.tertiaryHover, t)!,
      tertiaryDisable: Color.lerp(tertiaryDisable, other.tertiaryDisable, t)!,
      inverted: Color.lerp(inverted, other.inverted, t)!,
      invertedPressed: Color.lerp(invertedPressed, other.invertedPressed, t)!,
      invertedHover: Color.lerp(invertedHover, other.invertedHover, t)!,
      invertedDisable: Color.lerp(invertedDisable, other.invertedDisable, t)!,
      ghost: Color.lerp(ghost, other.ghost, t)!,
      ghostPressed: Color.lerp(ghostPressed, other.ghostPressed, t)!,
      ghostHover: Color.lerp(ghostHover, other.ghostHover, t)!,
      ghostDisable: Color.lerp(ghostDisable, other.ghostDisable, t)!,
      positive: Color.lerp(positive, other.positive, t)!,
      positivePressed: Color.lerp(positivePressed, other.positivePressed, t)!,
      positiveHover: Color.lerp(positiveHover, other.positiveHover, t)!,
      positiveDisable: Color.lerp(positiveDisable, other.positiveDisable, t)!,
      negative: Color.lerp(negative, other.negative, t)!,
      negativePressed: Color.lerp(negativePressed, other.negativePressed, t)!,
      negativeHover: Color.lerp(negativeHover, other.negativeHover, t)!,
      negativeDisable: Color.lerp(negativeDisable, other.negativeDisable, t)!,
    );
  }
}
