// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    required this.child,
    required this.shakeOffset,
    this.shakeCount = 2,
    this.animate = false,
    this.shakeDuration = const Duration(milliseconds: 300),
    super.key,
  });

  final Widget child;
  final double shakeOffset;
  final int shakeCount;
  final bool animate;
  final Duration shakeDuration;

  @override
  State<StatefulWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.shakeDuration,
    );
    _controller.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_updateStatus);
    _controller.dispose();
    super.dispose();
  }

  void _updateStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (_, child) {
        if (widget.animate) {
          _controller.forward();
        }
        final sineValue = sin(widget.shakeCount * 2 * pi * _controller.value);

        return Transform.translate(
          offset: Offset(sineValue * widget.shakeOffset, 0),
          child: child,
        );
      },
    );
  }
}
