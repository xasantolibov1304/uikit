// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/gradients/button_gradient_colors_palette.dart';
import 'package:uikit/theme/gradients/button_gradients.dart';

final lightButtonGradients = _generateGradientFromBrightness(Brightness.light);
final darkButtonGradients = _generateGradientFromBrightness(Brightness.dark);

ButtonGradients _generateGradientFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ButtonGradients(
      primary: LinearGradient(
        colors: [
          lightButtonGradientColors.primaryStart,
          lightButtonGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      secondary: LinearGradient(
        colors: [
          lightButtonGradientColors.secondaryStart,
          lightButtonGradientColors.secondaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      success: LinearGradient(
        colors: [
          lightButtonGradientColors.successStart,
          lightButtonGradientColors.successEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  } else {
    return ButtonGradients(
      primary: LinearGradient(
        colors: [
          darkButtonGradientColors.primaryStart,
          darkButtonGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      secondary: LinearGradient(
        colors: [
          darkButtonGradientColors.secondaryStart,
          darkButtonGradientColors.secondaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      success: LinearGradient(
        colors: [
          darkButtonGradientColors.successStart,
          darkButtonGradientColors.successEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
