// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:lottie/lottie.dart';

/// Loader driven by a Lottie animation (e.g. inside [CommonRefresher]).
///
/// - [progress] between `0` and `1` (pull-to-refresh drag): the animation is
///   scrubbed from its start to [pullEnd] (a fraction of the timeline), so
///   it follows the finger.
/// - [progress] `null` (loading): the animation loops, continuing from where
///   the pull left it.
///
/// ```dart
/// LottieLoader(asset: 'assets/lottie/logo.json', pullEnd: 0.5)
/// ```
class LottieLoader extends StatefulWidget {
  const LottieLoader({
    required this.asset,
    this.package,
    this.progress,
    this.pullEnd = 1,
    this.size = 40,
    this.fit = BoxFit.cover,
    super.key,
  }) : assert(pullEnd > 0 && pullEnd <= 1);

  /// Lottie JSON asset path.
  final String asset;

  /// Package that bundles [asset]; `null` for the app's own assets.
  final String? package;

  /// `null` = loading (loop), otherwise `0..1`.
  final double? progress;

  /// Part of the timeline played while pulling (`0.5` = first half).
  final double pullEnd;

  final double size;

  final BoxFit fit;

  @override
  State<LottieLoader> createState() => _LottieLoaderState();
}

class _LottieLoaderState extends State<LottieLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this);
  bool _loaded = false;

  @override
  void didUpdateWidget(covariant LottieLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    _sync();
  }

  void _onLoaded(LottieComposition composition) {
    _controller.duration = composition.duration;
    _loaded = true;
    _sync();
  }

  void _sync() {
    if (!_loaded) return;
    final progress = widget.progress;
    if (progress == null) {
      // repeat() continues from the current frame, then loops 0..1.
      if (!_controller.isAnimating) _controller.repeat();
    } else {
      _controller.stop();
      _controller.value = progress.clamp(0.0, 1.0) * widget.pullEnd;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: widget.size,
      child: Lottie.asset(
        widget.asset,
        package: widget.package,
        controller: _controller,
        onLoaded: _onLoaded,
        fit: widget.fit,
      ),
    );
  }
}
