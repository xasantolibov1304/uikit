// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';

// Project imports:
import 'package:uikit/utils/number_formatter.dart';

class NumberSlideAnimation extends StatefulWidget {
  const NumberSlideAnimation({
    required this.number,
    this.textStyle,
    //
    this.separator = ThousandSeparator.Space,
    this.fractionDigits = 2,
    //
    this.curve = Curves.easeInOut,
    this.duration = const Duration(seconds: 1),
    super.key,
  });

  final double number;
  final TextStyle? textStyle;

  final ThousandSeparator separator;
  final int fractionDigits;

  final Curve curve;
  final Duration duration;

  @override
  State<NumberSlideAnimation> createState() => _NumberSlideAnimationState();
}

class _NumberSlideAnimationState extends State<NumberSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _oldNumber;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _oldNumber = widget.number;
    _startAnimation();
  }

  @override
  void didUpdateWidget(covariant NumberSlideAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.number != widget.number) {
      _oldNumber = oldWidget.number;
      _startAnimation();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _startAnimation();
  }

  void _startAnimation() {
    _oldNumber = 0;
    _animation = Tween<double>(begin: _oldNumber, end: widget.number)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Text(
          NumberFormatterHelper.toCurrency(
                _animation.value,
                separator: widget.separator,
                fractionDigits: widget.fractionDigits,
              ) ??
              '',
          style: widget.textStyle,
        );
      },
    );
  }
}
