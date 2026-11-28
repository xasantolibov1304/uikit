// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

// Project imports:
import 'package:uikit/common/island_refresher/island_refresh_overlay.dart';

/// Builds what is shown inside the drop: [progress] `0..1` while pulling,
/// `null` while refreshing; [size] is the drop's diameter.
typedef IslandIndicatorBuilder = Widget Function(BuildContext context, double? progress, double size);

/// Pull-to-refresh that drips out of the iPhone Dynamic Island.
///
/// [CommonRefresher] uses it by itself on a device with a Dynamic Island
/// (see [UikitRefresherTheme.dynamicIsland]); use it directly only with an
/// [island] from `DynamicIsland.rectOf`.
///
/// 1. **Pull** — a drop of the island's black swells out of it on a gooey
///    neck and slides down with the finger, the indicator growing inside.
/// 2. **Armed** — the neck snaps with a haptic tick, the drop wobbles free
///    and the neck's stub springs back into the island.
/// 3. **Refresh** — on release the drop stays hanging below the island and
///    the indicator inside it loops until the [Future] from [onRefresh]
///    completes.
/// 4. **Done** — the drop dips, then is sucked back up into the island,
///    re-growing its neck on the way, and merges with a soft tap.
///
/// The child is passed on as is: make it always scrollable for a short list
/// to be pullable ([CommonRefresher] does).
class IslandRefresher extends StatefulWidget {
  const IslandRefresher({
    required this.child,
    required this.island,
    required this.onRefresh,
    required this.indicatorBuilder,
    super.key,
  });

  final Widget child;

  /// The Dynamic Island in global logical pixels.
  final Rect island;
  final Future<void> Function() onRefresh;
  final IslandIndicatorBuilder indicatorBuilder;

  @override
  State<IslandRefresher> createState() => _IslandRefresherState();
}

class _IslandRefresherState extends State<IslandRefresher> with TickerProviderStateMixin {
  /// How long the drop takes to go back into the island.
  static const _absorbDuration = Duration(milliseconds: 520);

  /// Pull distance (logical px) at which the neck snaps.
  static const _offsetToArmed = 96.0;

  /// The `complete` state lasts as long as the drop's way back, so the
  /// indicator holds its value (and no new pull starts) until it is in.
  static const _durations = RefreshIndicatorDurations(
    cancelDuration: Duration(milliseconds: 320),
    settleDuration: Duration(milliseconds: 220),
    finalizeDuration: Duration(milliseconds: 100),
    completeDuration: _absorbDuration,
  );

  final _indicator = IndicatorController();

  /// The drop, on the root overlay while a pull or refresh is under way.
  ///
  /// A plain [OverlayEntry], not an [OverlayPortal]: an OverlayPortal wraps
  /// the scroll view for good, and once a route has been pushed and popped
  /// over it, showing its overlay child during a scroll breaks the semantics
  /// tree ('!child.attached' / 'node.built' assertions).
  OverlayEntry? _entry;

  // Created in initState, not lazily: a lazy one first touched in dispose()
  // would look up TickerMode on a deactivated element.
  late final AnimationController _snap;
  late final AnimationController _absorb;

  /// Dips a little first, then shoots up into the island.
  late final CurvedAnimation _absorbCurve;

  @override
  void initState() {
    super.initState();
    _snap = AnimationController(vsync: this, duration: const Duration(milliseconds: 520));
    _absorb = AnimationController(vsync: this, duration: _absorbDuration);
    _absorbCurve = CurvedAnimation(parent: _absorb, curve: Curves.easeInBack);
  }

  @override
  void didUpdateWidget(covariant IslandRefresher oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_entry == null) return;
    // The entry is built by the overlay, not by this widget: rebuild it after
    // this frame so it picks up a new island or indicator.
    SchedulerBinding.instance.addPostFrameCallback((_) => _entry?.markNeedsBuild());
  }

  @override
  void dispose() {
    _removeEntry();
    _absorbCurve.dispose();
    _snap.dispose();
    _absorb.dispose();
    _indicator.dispose();
    super.dispose();
  }

  void _onStateChanged(IndicatorStateChange change) {
    switch (change.newState) {
      case IndicatorState.dragging:
        if (change.currentState.isArmed) {
          HapticFeedback.selectionClick();
        } else {
          _setPortal(true);
        }
      case IndicatorState.armed:
        HapticFeedback.mediumImpact();
        _snap.forward(from: 0);
      case IndicatorState.complete:
        _absorb.forward(from: 0).then((_) {
          if (mounted) HapticFeedback.lightImpact();
        });
      case IndicatorState.idle:
        _snap.value = 0;
        _absorb.value = 0;
        _setPortal(false);
      case IndicatorState.loading || IndicatorState.settling || IndicatorState.canceling || IndicatorState.finalizing:
        break;
    }
  }

  /// Shows or hides the overlay, outside of a build or layout pass.
  void _setPortal(bool visible) {
    if (SchedulerBinding.instance.schedulerPhase == SchedulerPhase.persistentCallbacks) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) _setPortal(visible);
      });
      return;
    }
    if ((_entry != null) == visible) return;
    if (visible) {
      _insertEntry();
    } else {
      _removeEntry();
    }
  }

  /// Puts the drop on the root overlay: the island is above any app bar or
  /// nested navigator.
  void _insertEntry() {
    final overlay = Overlay.maybeOf(context, rootOverlay: true);
    if (overlay == null) return;

    _entry = OverlayEntry(
      // The overlay sits above this widget, so the themes in between are
      // carried over to the drop.
      builder: (_) => InheritedTheme.captureAll(
        context,
        IslandRefreshOverlay(
          snap: _snap,
          absorb: _absorbCurve,
          island: widget.island,
          indicator: _indicator,
          indicatorBuilder: widget.indicatorBuilder,
        ),
        to: overlay.context,
      ),
    );
    overlay.insert(_entry!);
  }

  void _removeEntry() {
    final entry = _entry;
    if (entry == null) return;
    _entry = null;
    entry
      ..remove()
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: widget.onRefresh,
      controller: _indicator,
      autoRebuild: false,
      offsetToArmed: _offsetToArmed,
      onStateChanged: _onStateChanged,
      durations: _durations,
      builder: (context, child, controller) => child,
      child: widget.child,
    );
  }
}
