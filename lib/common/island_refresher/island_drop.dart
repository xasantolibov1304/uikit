// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/animation.dart';

/// Where the drop pulled out of the Dynamic Island is, for one frame.
///
/// While pulling ([pull] `0..1`) a drop of black swells out of the island's
/// bottom edge and slides down on a gooey neck that thins as it stretches.
/// At `1` (armed) the neck snaps: the drop hangs free and wobbles ([snap]),
/// and a short stub of the neck springs back up into the island. Past `1`
/// it only stretches a little further, like a rubber band.
final class IslandDrop {
  const IslandDrop._({
    required this.stub,
    required this.scale,
    required this.center,
    required this.island,
    required this.radius,
    required this.neckHalf,
    required this.progress,
  });

  factory IslandDrop.of({required Rect island, required double pull, required double snap}) {
    final p = pull.clamp(0.0, 1.5);
    final grow = Curves.easeOutCubic.transform(math.min(p, 1));
    final over = math.max(0.0, p - 1);
    final radius = maxRadius * grow;

    // Starts hidden inside the island, ends `travel` below it.
    final centerY = island.bottom + (-radius + (radius + travel) * grow) + overTravel * over;

    // A damped wobble right after the neck snaps.
    final wobble = snap <= 0 || snap >= 1 ? 0.0 : math.sin(snap * math.pi * 3) * (1 - snap) * 0.16;

    return IslandDrop._(
      stub: p >= 1 ? stubLength * (1 - Curves.easeOutBack.transform(snap.clamp(0.0, 1.0))) : 0,
      scale: Size(1 + wobble, 1 - wobble),
      center: Offset(island.center.dx, centerY),
      island: island,
      radius: radius,
      neckHalf: p >= 1 ? 0 : radius * 0.55 * math.pow(1 - p, 1.4),
      progress: math.min(p, 1),
    );
  }

  static const double travel = 30;
  static const double maxRadius = 17;
  static const double overTravel = 22;
  static const double stubLength = 10;

  /// Length of the neck's leftover sticking out of the island after the snap.
  final double stub;

  /// Horizontal / vertical squash of the drop while it wobbles.
  final Size scale;
  final Offset center;
  final Rect island;
  final double radius;

  /// Half the width of the neck at its thinnest; `0` once it has snapped.
  final double neckHalf;

  /// The pull up to the armed point, `0..1`.
  final double progress;

  bool get isVisible => radius > 0.5;

  bool get isAttached => progress < 1;

  /// The drop itself, squashed by [scale].
  Rect get bounds =>
      Rect.fromCenter(center: center, width: radius * 2 * scale.width, height: radius * 2 * scale.height);
}
