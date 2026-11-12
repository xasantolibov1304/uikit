// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/radii/uikit_radii.dart';
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

const _thumbSize = Size(28, 28);

class DoubleSlider extends StatelessWidget {
  const DoubleSlider({
    required this.min,
    required this.max,
    required this.values,
    required this.onChanged,
    this.divisions,
    super.key,
  });

  final double min;
  final double max;

  final RangeValues values;

  final int? divisions;

  final void Function(RangeValues) onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 6,
        thumbColor: context.surfaceColors.tertiary,
        thumbSize: WidgetStatePropertyAll(_thumbSize),
        activeTrackColor: context.borderColors.success,
        inactiveTrackColor: context.borderColors.primary,
        overlayShape: const RoundSliderOverlayShape(),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          pressedElevation: 0,
          enabledThumbRadius: 14,
        ),
        showValueIndicator: ShowValueIndicator.always,
        trackShape: const RoundedRectSliderTrackShape(),
        minThumbSeparation: (max - min) / 2,
        valueIndicatorColor: context.surfaceColors.tertiary,
        valueIndicatorStrokeColor: context.borderColors.primary,
        valueIndicatorTextStyle: context.titleTextStyle.title3,
        rangeValueIndicatorShape: _RangeSliderValueIndicatorShape(
          shadowColor: context.systemColors.black.withValues(alpha: 0.05),
          radius: context.radii.md,
        ),
        overlayColor: context.borderColors.success.withValues(alpha: 0.1),
      ),
      child: RangeSlider(
        min: min,
        max: max,
        values: values,
        divisions: divisions,
        labels: RangeLabels(
          _formatLabel(values.start),
          _formatLabel(values.end),
        ),
        onChanged: onChanged,
      ),
    );
  }

  String _formatLabel(double value) {
    final percent = ((value - min) / (max - min) * 100).round();
    return '$percent%';
  }
}

class _RangeSliderValueIndicatorShape extends RangeSliderValueIndicatorShape {
  const _RangeSliderValueIndicatorShape({
    required this.shadowColor,
    required this.radius,
  });

  final Color shadowColor;
  final double radius;

  @override
  Size getPreferredSize(
    bool isEnabled,
    bool isDiscrete, {
    required TextPainter labelPainter,
    required double textScaleFactor,
  }) {
    return Size(
      labelPainter.width + 24,
      labelPainter.height + 16,
    );
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = true,
    bool isOnTop = false,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    Size? sizeWithOverflow,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    double? textScaleFactor,
    Thumb? thumb,
    double value = 0.0,
  }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = sliderTheme.valueIndicatorColor!
      ..style = PaintingStyle.fill;

    final Paint borderPaint = Paint()
      ..color = sliderTheme.valueIndicatorStrokeColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Paint shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    final double indicatorHeight = labelPainter.height + 16;
    final double thumbRadius = 14;
    final double verticalOffset = indicatorHeight / 2 + thumbRadius + 8;

    final Offset adjustedCenter = center.translate(0, -verticalOffset);

    final RRect indicatorRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: adjustedCenter,
        width: labelPainter.width + 24,
        height: indicatorHeight,
      ),
      Radius.circular(radius),
    );

    final RRect shadowRect = indicatorRect.shift(const Offset(0, 4));
    canvas.drawRRect(shadowRect, shadowPaint);

    canvas.drawRRect(indicatorRect, paint);
    canvas.drawRRect(indicatorRect, borderPaint);

    labelPainter.paint(
      canvas,
      adjustedCenter.translate(
        -labelPainter.width / 2,
        -labelPainter.height / 2,
      ),
    );
  }
}
