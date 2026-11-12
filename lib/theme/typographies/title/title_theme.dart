// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/text/text_colors.dart';
import 'package:uikit/theme/colors/text/text_colors_palette.dart';
import 'package:uikit/theme/typographies/uikit_font.dart';
import 'package:uikit/theme/typographies/title/title_text_styles.dart';

final lightTitleTextStyles =
    createTitleTextStyles(brightness: Brightness.light);
final darkTitleTextStyles = createTitleTextStyles(brightness: Brightness.dark);

/// Builds [TitleTextStyles] for [brightness].
///
/// - [fontFamily] / [fontPackage]: font to use. Pass `fontPackage: null`
///   for a font declared in the app's own `pubspec.yaml`.
/// - [textColors]: colors for the styles; defaults to uikit's palette.
TitleTextStyles createTitleTextStyles({
  required Brightness brightness,
  String fontFamily = UikitFont.family,
  String? fontPackage = UikitFont.package,
  TextColors? textColors,
}) {
  final colors = textColors ??
      (brightness == Brightness.light ? lightTextColors : darkTextColors);
  final baseTypography = TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: fontFamily,
    package: fontPackage,
    letterSpacing: 0,
  );

  return TitleTextStyles(
    title1: baseTypography.copyWith(
      fontSize: 24,
      height: 28 / 24,
      color: colors.primary,
    ),
    title2: baseTypography.copyWith(
      fontSize: 20,
      height: 24 / 20,
      color: colors.primary,
    ),
    title3: baseTypography.copyWith(
      fontSize: 16,
      height: 20 / 16,
      color: colors.primary,
    ),
    title4: baseTypography.copyWith(
      fontSize: 14,
      height: 16 / 14,
      color: colors.primary,
    ),
  );
}
