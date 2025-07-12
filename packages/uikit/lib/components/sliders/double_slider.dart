// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _thumbSize = Size(28, 28);

class DoubleSlider extends StatefulWidget {
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

  final ValueChanged<RangeValues> onChanged;

  @override
  State<DoubleSlider> createState() => _DoubleSliderState();
}

class _DoubleSliderState extends State<DoubleSlider> {
  late RangeValues _currentValues;

  @override
  void initState() {
    super.initState();
    _currentValues = widget.values;
  }

  @override
  void didUpdateWidget(covariant DoubleSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.values != widget.values) {
      _currentValues = widget.values;
    }
  }

  String _formatLabel(double value) {
    final percent =
        ((value - widget.min) / (widget.max - widget.min) * 100).round();
    return '$percent%';
  }

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
        valueIndicatorColor: context.surfaceColors.tertiary,
        valueIndicatorStrokeColor: context.borderColors.primary,
        valueIndicatorTextStyle: context.titleTextStyle.compact1,
        rangeValueIndicatorShape: _RangeSliderValueIndicatorShape(),
        overlayColor: context.borderColors.success.withValues(alpha: 0.1),
      ),
      child: RangeSlider(
          min: widget.min,
          max: widget.max,
          values: _currentValues,
          divisions: widget.divisions,
          labels: RangeLabels(
            _formatLabel(_currentValues.start),
            _formatLabel(_currentValues.end),
          ),
          onChanged: (RangeValues values) {
            setState(() {
              if (values.end - values.start >= 10) {
                _currentValues = values;
              } else {
                if (_currentValues.start == values.start) {
                  _currentValues = RangeValues(
                      _currentValues.start, _currentValues.start + 10);
                } else {
                  _currentValues =
                      RangeValues(_currentValues.end - 10, _currentValues.end);
                }
              }
            });
          }),
    );
  }
}

class _RangeSliderValueIndicatorShape extends RangeSliderValueIndicatorShape {
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
      ..color = const Color(0x0D000000)
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
      const Radius.circular(8),
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
