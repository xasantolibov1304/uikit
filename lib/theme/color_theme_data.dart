// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/colors/colors.dart';

extension ColorThemeDataExtension on ThemeData {
  AdditionalColors get additionalColors => extension<AdditionalColors>() ?? lightAdditionalColors;

  BorderColors get borderColors => extension<BorderColors>() ?? lightBorderColors;

  ButtonColors get buttonColors => extension<ButtonColors>() ?? lightButtonColors;

  IconColors get iconColors => extension<IconColors>() ?? lightIconColors;

  SurfaceColors get surfaceColors => extension<SurfaceColors>() ?? lightSurfaceColors;

  SystemColors get systemColors => extension<SystemColors>() ?? lightSystemColors;

  TextColors get textColors => extension<TextColors>() ?? lightTextColors;
}

extension ColorThemeDataContextExtension on BuildContext {
  AdditionalColors get additionalColors => Theme.of(this).additionalColors;

  BorderColors get borderColors => Theme.of(this).borderColors;

  ButtonColors get buttonColors => Theme.of(this).buttonColors;

  IconColors get iconColors => Theme.of(this).iconColors;

  SurfaceColors get surfaceColors => Theme.of(this).surfaceColors;

  SystemColors get systemColors => Theme.of(this).systemColors;

  TextColors get textColors => Theme.of(this).textColors;
}
