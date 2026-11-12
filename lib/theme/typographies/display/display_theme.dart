// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/text/text_colors.dart';
import 'package:uikit/theme/colors/text/text_colors_palette.dart';
import 'package:uikit/theme/typographies/uikit_font.dart';
import 'package:uikit/theme/typographies/display/display_text_styles.dart';

final lightDisplayTextStyle =
    createDisplayTextStyles(brightness: Brightness.light);
final darkDisplayTextStyle =
    createDisplayTextStyles(brightness: Brightness.dark);

/// Builds [DisplayTextStyles] for [brightness].
///
/// - [fontFamily] / [fontPackage]: font to use. Pass `fontPackage: null`
///   for a font declared in the app's own `pubspec.yaml`.
/// - [textColors]: colors for the styles; defaults to uikit's palette.
DisplayTextStyles createDisplayTextStyles({
  required Brightness brightness,
  String fontFamily = UikitFont.family,
  String? fontPackage = UikitFont.package,
  TextColors? textColors,
}) {
  final colors = textColors ??
      (brightness == Brightness.light ? lightTextColors : darkTextColors);
  final baseTypography = TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    package: fontPackage,
    letterSpacing: 0,
  );

  return DisplayTextStyles(
    display1: baseTypography.copyWith(
      fontSize: 44,
      height: 44 / 44,
      color: colors.primary,
    ),
    display2: baseTypography.copyWith(
      fontSize: 40,
      height: 40 / 40,
      color: colors.primary,
    ),
    display3: baseTypography.copyWith(
      fontSize: 36,
      height: 38 / 36,
      color: colors.primary,
    ),
    display4: baseTypography.copyWith(
      fontSize: 32,
      height: 36 / 32,
      color: colors.primary,
    ),
    display5: baseTypography.copyWith(
      fontSize: 28,
      height: 32 / 28,
      color: colors.primary,
    ),
  );
}
