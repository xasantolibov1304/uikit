// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/text/text_colors.dart';
import 'package:uikit/theme/colors/text/text_colors_palette.dart';
import 'package:uikit/theme/typographies/uikit_font.dart';
import 'package:uikit/theme/typographies/others/others_text_styles.dart';

final lightOthersTextStyles =
    createOthersTextStyles(brightness: Brightness.light);
final darkOthersTextStyles =
    createOthersTextStyles(brightness: Brightness.dark);

/// Builds [OthersTextStyles] for [brightness].
///
/// - [fontFamily] / [fontPackage]: font to use. Pass `fontPackage: null`
///   for a font declared in the app's own `pubspec.yaml`.
/// - [textColors]: colors for the styles; defaults to uikit's palette.
OthersTextStyles createOthersTextStyles({
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

  return OthersTextStyles(
    cardBank: baseTypography.copyWith(
      fontSize: 24,
      height: 28 / 24,
      color: colors.primary,
    ),
  );
}
