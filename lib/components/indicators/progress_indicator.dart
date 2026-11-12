// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import 'package:uikit/theme/app_typography_theme_data.dart';
import 'package:uikit/theme/color_theme_data.dart';

class CommonProgressIndicator extends StatefulWidget {
  const CommonProgressIndicator({
    required this.percentage,
    this.height = 8,
    this.backgroundColor,
    this.progressColor,
    this.percentageTextStyle,
    super.key,
  });

  final double percentage;
  final double height;
  final Color? backgroundColor;
  final Color? progressColor;
  final TextStyle? percentageTextStyle;

  @override
  State<CommonProgressIndicator> createState() =>
      _CommonProgressIndicatorState();
}

class _CommonProgressIndicatorState extends State<CommonProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _oldPercent = 0.0;

  @override
  void initState() {
    super.initState();
    _oldPercent = widget.percentage.clamp(0.0, 1.0);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(
            begin: _oldPercent, end: widget.percentage.clamp(0.0, 1.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant CommonProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.percentage != widget.percentage) {
      _oldPercent = _animation.value;
      _animation = Tween<double>(
        begin: _oldPercent,
        end: widget.percentage.clamp(0.0, 1.0),
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor ??
                          context.surfaceColors.secondary,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: _animation.value,
                    child: Container(
                      height: widget.height,
                      decoration: BoxDecoration(
                        color: widget.progressColor ??
                            context.surfaceColors.success,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 8),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Text(
              '${(_animation.value * 100).round()}%',
              style: widget.percentageTextStyle ?? context.baseTextStyle.base3,
            );
          },
        ),
      ],
    );
  }
}
