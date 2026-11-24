// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

// Project imports:
import 'package:uikit/common/island_refresher/island_drop.dart';
import 'package:uikit/common/island_refresher/island_drop_painter.dart';
import 'package:uikit/common/island_refresher/island_refresher.dart';
import 'package:uikit/utils/dynamic_island.dart';

/// The drop [IslandRefresher] draws over the whole screen, hanging from the
/// Dynamic Island ([IslandDrop]), with the indicator inside it.
///
/// The drop follows the [indicator] while pulling and stays put while the
/// refresh runs. [absorb] `0 → 1` then plays the pull backwards: the drop
/// rises, its neck grows back, and it melts into the island.
class IslandRefreshOverlay extends StatelessWidget {
  const IslandRefreshOverlay({
    required this.snap,
    required this.absorb,
    required this.island,
    required this.indicator,
    required this.indicatorBuilder,
    super.key,
  });

  final Animation<double> snap;
  final Animation<double> absorb;
  final Rect island;
  final IndicatorController indicator;
  final IslandIndicatorBuilder indicatorBuilder;

  /// A drop smaller than this has no room for the indicator.
  static const double _minContentRadius = 8;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: Listenable.merge([snap, absorb, indicator]),
        builder: (context, _) {
          final pull = indicator.value * (1 - absorb.value);
          final drop = IslandDrop.of(island: island, pull: pull, snap: snap.value);
          final bounds = drop.bounds;
          final spinning = indicator.isSettling || indicator.isLoading;

          return Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: IslandDropPainter(drop: drop, color: DynamicIsland.color),
                ),
              ),
              if (drop.radius >= _minContentRadius)
                Positioned.fromRect(
                  rect: bounds,
                  child: Opacity(
                    opacity: (1 - absorb.value).clamp(0.0, 1.0),
                    child: indicatorBuilder(context, spinning ? null : drop.progress, bounds.shortestSide),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
