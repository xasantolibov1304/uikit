// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/typographies/typographies.dart';

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
  DisplayTextStyles get displayTextStyle =>
      extension<DisplayTextStyles>() ?? lightDisplayTextStyle;

  TitleTextStyles get titleTextStyle =>
      extension<TitleTextStyles>() ?? lightTitleTextStyles;

  SubtitleTextStyles get subtitleTextStyle =>
      extension<SubtitleTextStyles>() ?? lightSubtitleTextStyles;

  LabelTextStyles get labelTextStyle =>
      extension<LabelTextStyles>() ?? lightLabelTextStyles;

  BodyTextStyles get bodyTextStyle =>
      extension<BodyTextStyles>() ?? lightBodyTextStyles;

  ButtonTextStyles get buttonTextStyle =>
      extension<ButtonTextStyles>() ?? lightButtonTextStyles;
}

extension AppTypographyThemeDataContextExtension on BuildContext {
  DisplayTextStyles get displayTextStyle => Theme.of(this).displayTextStyle;

  TitleTextStyles get titleTextStyle => Theme.of(this).titleTextStyle;

  SubtitleTextStyles get subtitleTextStyle => Theme.of(this).subtitleTextStyle;

  LabelTextStyles get labelTextStyle => Theme.of(this).labelTextStyle;

  BodyTextStyles get bodyTextStyle => Theme.of(this).bodyTextStyle;

  ButtonTextStyles get buttonTextStyle => Theme.of(this).buttonTextStyle;
}
