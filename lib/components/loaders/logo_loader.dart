// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/theme/color_theme_data.dart';

/// Animated logo used as a loader (e.g. inside [CommonRefresher]).
///
/// - [progress] between `0` and `1` (pull-to-refresh drag): the logo spins
///   in and grows, the ring around it fills up.
/// - [progress] `null` (loading): the ring rotates and the logo pulses.
///
/// ```dart
/// LogoLoader(logo: Image.asset('assets/images/logo.png'))
/// ```
class LogoLoader extends StatefulWidget {
  const LogoLoader({
    required this.logo,
    this.progress,
    this.size = 40,
    this.color,
    this.strokeWidth = 2.5,
    super.key,
  });

  /// Any widget; it is clipped to a circle.
  final Widget logo;

  /// `null` = indeterminate (loading), otherwise `0..1`.
  final double? progress;

  final double size;

  /// Ring color. Defaults to `context.iconColors.success`.
  final Color? color;

  final double strokeWidth;

  @override
  State<LogoLoader> createState() => _LogoLoaderState();
}

class _LogoLoaderState extends State<LogoLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _loop = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  );

  bool get _isLoading => widget.progress == null;

  @override
  void initState() {
    super.initState();
    _syncLoop();
  }

  @override
  void didUpdateWidget(covariant LogoLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if ((oldWidget.progress == null) != _isLoading) {
      _syncLoop();
    }
  }

  void _syncLoop() {
    if (_isLoading) {
      _loop.repeat();
    } else {
      _loop.stop();
      _loop.value = 0;
    }
  }

  @override
  void dispose() {
    _loop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? context.iconColors.success;

    return SizedBox.square(
      dimension: widget.size,
      child: AnimatedBuilder(
        animation: _loop,
        builder: (context, child) {
          final double scale;
          final double turns;
          final double opacity;
          final double arcStart;
          final double arcSweep;

          if (_isLoading) {
            final t = _loop.value;
            final wave = math.sin(t * 2 * math.pi);
            scale = 0.94 + 0.06 * wave;
            turns = 0;
            opacity = 1;
            arcStart = t * 2 * math.pi - math.pi / 2;
            arcSweep = math.pi * (0.55 + 0.35 * wave);
          } else {
            final p = widget.progress!.clamp(0.0, 1.0);
            final eased = Curves.easeOut.transform(p);
            scale = 0.6 + 0.4 * eased;
            turns = -0.5 * (1 - eased);
            opacity = (p * 1.5).clamp(0.0, 1.0);
            arcStart = -math.pi / 2;
            arcSweep = 2 * math.pi * p;
          }

          return CustomPaint(
            painter: _RingPainter(
              color: color,
              start: arcStart,
              sweep: arcSweep,
              strokeWidth: widget.strokeWidth,
            ),
            child: Padding(
              padding: EdgeInsets.all(widget.strokeWidth + 1.5),
              child: Opacity(
                opacity: opacity,
                child: Transform.scale(
                  scale: scale,
                  child: Transform.rotate(
                    angle: turns * 2 * math.pi,
                    child: child,
                  ),
                ),
              ),
            ),
          );
        },
        child: ClipOval(
          child: SizedBox.expand(
            child: FittedBox(fit: BoxFit.cover, child: widget.logo),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  const _RingPainter({
    required this.color,
    required this.start,
    required this.sweep,
    required this.strokeWidth,
  });

  final Color color;
  final double start;
  final double sweep;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (sweep <= 0) return;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final rect = (Offset.zero & size).deflate(strokeWidth / 2);
    canvas.drawArc(rect, start, sweep, false, paint);
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.color != color ||
      old.start != start ||
      old.sweep != sweep ||
      old.strokeWidth != strokeWidth;
}
