// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/colors/colors.dart';

extension ColorThemeDataExtension on ThemeData {
  SystemColors get systemColors => extension<SystemColors>() ?? lightSystemColors;

  SurfaceColors get surfaceColors => extension<SurfaceColors>() ?? lightSurfaceColors;

  TextColors get textColors => extension<TextColors>() ?? lightTextColors;

  IconColors get iconColors => extension<IconColors>() ?? lightIconColors;

  BorderColors get borderColors => extension<BorderColors>() ?? lightBorderColors;

  StatusColors get statusColors => extension<StatusColors>() ?? lightStatusColors;

  ButtonColors get buttonColors => extension<ButtonColors>() ?? lightButtonColors;

  BrandColors get brandColors => extension<BrandColors>() ?? lightBrandColors;
}

extension ColorThemeDataContextExtension on BuildContext {
  SystemColors get systemColors => Theme.of(this).systemColors;

  SurfaceColors get surfaceColors => Theme.of(this).surfaceColors;

  TextColors get textColors => Theme.of(this).textColors;

  BorderColors get borderColors => Theme.of(this).borderColors;

  IconColors get iconColors => Theme.of(this).iconColors;

  StatusColors get statusColors => Theme.of(this).statusColors;

  ButtonColors get buttonColors => Theme.of(this).buttonColors;

  BrandColors get brandColors => Theme.of(this).brandColors;
}
