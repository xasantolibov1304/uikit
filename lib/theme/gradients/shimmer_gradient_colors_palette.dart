// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/gradients/shimmer_gradient_colors.dart';
import 'package:uikit/theme/palette.dart';

final lightShimmerGradientColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkShimmerGradientColors =
    _generatePaletteFromBrightness(Brightness.dark);

ShimmerGradientColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ShimmerGradientColors(
      primaryStart: Palette.gray[10]!,
      primaryCenter: Palette.gray[10]!,
      primaryEnd: Palette.gray[10]!,
      secondaryStart: Palette.gray[10]!,
      secondaryCenter: Palette.gray[10]!,
      secondaryEnd: Palette.gray[10]!,
    );
  } else {
    return ShimmerGradientColors(
      primaryStart: Palette.gray[70]!,
      primaryCenter: Palette.gray[50]!,
      primaryEnd: Palette.gray[70]!,
      secondaryStart: Palette.gray[70]!,
      secondaryCenter: Palette.gray[50]!,
      secondaryEnd: Palette.gray[70]!,
    );
  }
}
