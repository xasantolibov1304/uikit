// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/gradients/card_gradient_colors.dart';
import 'package:uikit/theme/palette.dart';

final lightCardGradientColors =
    _generatePaletteFromBrightness(Brightness.light);
final darkCardGradientColors = _generatePaletteFromBrightness(Brightness.dark);

CardGradientColors _generatePaletteFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return CardGradientColors(
      primaryStart: Palette.gray[10]!,
      primaryEnd: Palette.gray[10]!,
      secondaryStart: Palette.purple[10]!,
      secondaryEnd: Palette.blue[10]!,
      accentStart: Palette.purple[40]!,
      accentEnd: Palette.blue[50]!,
    );
  } else {
    return CardGradientColors(
      primaryStart: Palette.gray[90]!,
      primaryEnd: Palette.gray[80]!,
      secondaryStart: Palette.purple[90]!,
      secondaryEnd: Palette.blue[90]!,
      accentStart: Palette.purple[70]!,
      accentEnd: Palette.blue[70]!,
    );
  }
}
