// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/gradients/gradients.dart';
import 'package:iman_uikit/theme/gradients/shimmer_gradient_colors_palette.dart';

final lightShimmerGradients = _generateGradientFromBrightness(Brightness.light);
final darkShimmerGradients = _generateGradientFromBrightness(Brightness.dark);

ShimmerGradients _generateGradientFromBrightness(Brightness brightness) {
  if (brightness == Brightness.light) {
    return ShimmerGradients(
      base: LinearGradient(
        colors: [
          lightShimmerGradientColors.primaryStart,
          lightShimmerGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      primary: LinearGradient(
        colors: [
          lightShimmerGradientColors.primaryStart,
          lightShimmerGradientColors.primaryCenter,
          lightShimmerGradientColors.primaryEnd,
        ],
        stops: const [0.35, 0.5, 0.65],
        begin: const Alignment(-1.0, -0.2),
        end: const Alignment(1.0, 0.2),
      ),
      secondary: LinearGradient(
        colors: [
          lightShimmerGradientColors.secondaryStart,
          lightShimmerGradientColors.secondaryCenter,
          lightShimmerGradientColors.secondaryEnd,
        ],
        stops: const [0.35, 0.5, 0.65],
        begin: const Alignment(-1.0, -0.2),
        end: const Alignment(1.0, 0.2),
      ),
    );
  } else {
    return ShimmerGradients(
      base: LinearGradient(
        colors: [
          darkShimmerGradientColors.primaryStart,
          darkShimmerGradientColors.primaryEnd,
        ],
        stops: const [0.0, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      primary: LinearGradient(
        colors: [
          darkShimmerGradientColors.primaryStart,
          darkShimmerGradientColors.primaryCenter,
          darkShimmerGradientColors.primaryEnd,
        ],
        stops: const [0.35, 0.5, 0.65],
        begin: const Alignment(-1.0, -0.2),
        end: const Alignment(1.0, 0.2),
      ),
      secondary: LinearGradient(
        colors: [
          darkShimmerGradientColors.secondaryStart,
          darkShimmerGradientColors.secondaryCenter,
          darkShimmerGradientColors.secondaryEnd,
        ],
        stops: const [0.35, 0.5, 0.65],
        begin: const Alignment(-1.0, -0.2),
        end: const Alignment(1.0, 0.2),
      ),
    );
  }
}
