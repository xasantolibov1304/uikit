// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/gradients/gradients.dart';
import 'package:iman_uikit/theme/gradients/toast_gradient_colors_palette.dart';

final lightToastGradients = _generateGradientFromBrightness(Brightness.light);
final darkToastGradients = _generateGradientFromBrightness(Brightness.dark);

ToastGradients _generateGradientFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ToastGradients(
      primary: LinearGradient(
        colors: [
          lightToastGradientColors.grayStart,
          lightToastGradientColors.grayEnd,
        ],
        stops: const [0.1, 1],
      ),
    );
  } else {
    return ToastGradients(
      primary: LinearGradient(
        colors: [
          darkToastGradientColors.grayStart,
          darkToastGradientColors.grayEnd,
        ],
        stops: const [0.1, 1],
      ),
    );
  }
}
