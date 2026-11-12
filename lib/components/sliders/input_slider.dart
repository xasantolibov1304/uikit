// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/color_theme_data.dart';

const _dividerSize = Size(2, 3);
const _thumbSize = Size(20, 8);

class InputSlider extends StatelessWidget {
  const InputSlider({
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.child,
    super.key,
  });

  final double value;
  final ValueChanged<double> onChanged;

  final double min;
  final double max;

  final int? divisions;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return child == null
        ? _buildSlider(context)
        : Stack(
            clipBehavior: Clip.none,
            children: [
              if (child != null) child!,
              Positioned(
                left: 0,
                right: 0,
                bottom: -4,
                child: _buildSlider(context),
              ),
            ],
          );
  }

  Widget _buildSlider(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 2,
        thumbColor: context.borderColors.success,
        thumbShape: _RectangularSliderThumbShape(),
        trackShape: RectangularSliderTrackShape(),
        overlayShape: SliderComponentShape.noOverlay,
        tickMarkShape: _RectangularSliderDividerShape(
          dividerColor: context.borderColors.secondary,
        ),
        activeTrackColor: context.borderColors.success,
        inactiveTrackColor: context.borderColors.primary,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Slider(
          min: min,
          max: max,
          value: value,
          onChanged: onChanged,
          divisions: divisions,
        ),
      ),
    );
  }
}

class _RectangularSliderDividerShape extends SliderTickMarkShape {
  _RectangularSliderDividerShape({
    required this.dividerColor,
  });

  final Color dividerColor;

  @override
  Size getPreferredSize({
    required bool isEnabled,
    required SliderThemeData sliderTheme,
  }) {
    return _dividerSize;
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    required bool isEnabled,
    required TextDirection textDirection,
  }) {
    final Canvas canvas = context.canvas;
    final Paint paint = Paint()
      ..color = dividerColor
      ..style = PaintingStyle.fill;

    final Rect dividerRect = Rect.fromLTWH(
      center.dx - _dividerSize.width,
      center.dy - _dividerSize.height + 1,
      _dividerSize.width,
      _dividerSize.height,
    );
    canvas.drawRect(dividerRect, paint);
  }
}

class _RectangularSliderThumbShape extends SliderComponentShape {
  const _RectangularSliderThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(50, 10);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter? labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final Paint paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.green
      ..style = PaintingStyle.fill;

    final Rect thumbRect = Rect.fromCenter(
      center: center,
      width: _thumbSize.width,
      height: _thumbSize.height,
    );

    final rRect = RRect.fromRectAndRadius(
      thumbRect,
      Radius.circular(_thumbSize.height / 2),
    );
    canvas.drawRRect(rRect, paint);
  }
}
