// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/typographies/typographies.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get regular => copyWith(
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      );
  TextStyle get medium => copyWith(
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      );
  TextStyle get semibold => copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0,
      );
  TextStyle get bold => copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 0,
      );
}

extension AppTypographyThemeDataExtension on ThemeData {
  DisplayTextStyles get displayTextStyle => extension<DisplayTextStyles>() ?? lightDisplayTextStyle;

  TitleTextStyles get titleTextStyle => extension<TitleTextStyles>() ?? lightTitleTextStyles;

  BaseTextStyles get baseTextStyle => extension<BaseTextStyles>() ?? lightBaseTextStyles;

  OthersTextStyles get othersTextStyle => extension<OthersTextStyles>() ?? lightOthersTextStyles;
}

extension AppTypographyThemeDataContextExtension on BuildContext {
  DisplayTextStyles get displayTextStyle => Theme.of(this).displayTextStyle;

  TitleTextStyles get titleTextStyle => Theme.of(this).titleTextStyle;

  BaseTextStyles get baseTextStyle => Theme.of(this).baseTextStyle;

  OthersTextStyles get othersTextStyle => Theme.of(this).othersTextStyle;
}
