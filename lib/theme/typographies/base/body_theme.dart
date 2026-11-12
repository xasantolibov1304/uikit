// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/text/text_colors.dart';
import 'package:uikit/theme/colors/text/text_colors_palette.dart';
import 'package:uikit/theme/typographies/uikit_font.dart';
import 'package:uikit/theme/typographies/base/body_text_styles.dart';

final lightBaseTextStyles = createBaseTextStyles(brightness: Brightness.light);
final darkBaseTextStyles = createBaseTextStyles(brightness: Brightness.dark);

/// Builds [BaseTextStyles] for [brightness].
///
/// - [fontFamily] / [fontPackage]: font to use. Pass `fontPackage: null`
///   for a font declared in the app's own `pubspec.yaml`.
/// - [textColors]: colors for the styles; defaults to uikit's palette.
BaseTextStyles createBaseTextStyles({
  required Brightness brightness,
  String fontFamily = UikitFont.family,
  String? fontPackage = UikitFont.package,
  TextColors? textColors,
}) {
  final colors = textColors ??
      (brightness == Brightness.light ? lightTextColors : darkTextColors);
  final baseTypography = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: fontFamily,
    package: fontPackage,
    letterSpacing: 0,
  );

  return BaseTextStyles(
    base1: baseTypography.copyWith(
      fontSize: 16,
      height: 20 / 16,
      color: colors.primary,
    ),
    base2: baseTypography.copyWith(
      fontSize: 15,
      height: 20 / 15,
      color: colors.primary,
    ),
    base3: baseTypography.copyWith(
      fontSize: 14,
      height: 18 / 14,
      color: colors.primary,
    ),
    base4: baseTypography.copyWith(
      fontSize: 13,
      height: 16 / 13,
      color: colors.primary,
    ),
    base5: baseTypography.copyWith(
      fontSize: 12,
      height: 14 / 12,
      color: colors.primary,
    ),
    base6: baseTypography.copyWith(
      fontSize: 10,
      height: 12 / 10,
      color: colors.primary,
    ),
  );
}
