// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/typographies/typographies.dart';

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

  InputTextStyles get inputTextStyle =>
      extension<InputTextStyles>() ?? lightInputTextStyles;
}

extension AppTypographyThemeDataContextExtension on BuildContext {
  DisplayTextStyles get displayTextStyle => Theme.of(this).displayTextStyle;

  TitleTextStyles get titleTextStyle => Theme.of(this).titleTextStyle;

  SubtitleTextStyles get subtitleTextStyle => Theme.of(this).subtitleTextStyle;

  LabelTextStyles get labelTextStyle => Theme.of(this).labelTextStyle;

  BodyTextStyles get bodyTextStyle => Theme.of(this).bodyTextStyle;

  ButtonTextStyles get buttonTextStyle => Theme.of(this).buttonTextStyle;

  InputTextStyles get inputTextStyle => Theme.of(this).inputTextStyle;
}
