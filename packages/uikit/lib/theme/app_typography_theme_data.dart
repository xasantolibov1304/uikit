// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/typographies/typographies.dart';

extension AppTypographyThemeDataExtension on ThemeData {
  DisplayTextStyles get display =>
      extension<DisplayTextStyles>() ?? lightDisplayTextStyle;

  TitleTextStyles get title =>
      extension<TitleTextStyles>() ?? lightTitleTextStyles;

  SubtitleTextStyles get subtitle =>
      extension<SubtitleTextStyles>() ?? lightSubtitleTextStyles;

  LabelTextStyles get label =>
      extension<LabelTextStyles>() ?? lightLabelTextStyles;

  BodyTextStyles get body => extension<BodyTextStyles>() ?? lightBodyTextStyles;

  ButtonTextStyles get button =>
      extension<ButtonTextStyles>() ?? lightButtonTextStyles;

  InputTextStyles get input =>
      extension<InputTextStyles>() ?? lightInputTextStyles;
}

extension AppTypographyThemeDataContextExtension on BuildContext {
  DisplayTextStyles get display => Theme.of(this).display;

  TitleTextStyles get title => Theme.of(this).title;

  SubtitleTextStyles get subtitle => Theme.of(this).subtitle;

  LabelTextStyles get label => Theme.of(this).label;

  BodyTextStyles get body => Theme.of(this).body;

  ButtonTextStyles get button => Theme.of(this).button;

  InputTextStyles get input => Theme.of(this).input;
}
