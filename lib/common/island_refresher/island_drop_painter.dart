// Dart imports:
import 'dart:math' as math;

// Flutter imports:
import 'package:flutter/rendering.dart';

// Project imports:
import 'package:uikit/common/island_refresher/island_drop.dart';

/// Paints an [IslandDrop]: the drop, the neck that ties it to the island
/// and, after the neck snaps, the stub springing back into the island.
///
/// Everything starts a few points inside the island's outline, where the
/// screen has no pixels, so the shape seems to grow out of the hardware.
final class IslandDropPainter extends CustomPainter {
  const IslandDropPainter({required this.drop, required this.color});

  final Color color;
  final IslandDrop drop;

  /// How far above the island's bottom edge the neck is rooted.
  static const double _root = 6;

  /// Angle (from straight up) where the neck meets the drop.
  static const double _contact = 0.95;

  @override
  void paint(Canvas canvas, Size size) {
    if (!drop.isVisible) return;

    final paint = Paint()
      ..color = color
      ..isAntiAlias = true;
    final island = drop.island;
    final cx = island.center.dx;

    canvas.drawOval(drop.bounds, paint);

    if (drop.isAttached) {
      canvas.drawPath(_neck(cx, island.bottom), paint);
    } else if (drop.stub > 0) {
      final stub = math.max(0.0, drop.stub);
      final half = drop.radius * 0.45;
      final path = Path()
        ..moveTo(cx - half * 1.6, island.bottom - _root)
        ..quadraticBezierTo(cx - half, island.bottom, cx, island.bottom + stub)
        ..quadraticBezierTo(cx + half, island.bottom, cx + half * 1.6, island.bottom - _root)
        ..close();
      canvas.drawPath(path, paint);
    }
  }

  /// A metaball-like bridge: wide where it leaves the island, pinched to
  /// [IslandDrop.neckHalf] half-way, and hugging the drop's shoulders.
  Path _neck(double cx, double bottom) {
    final r = drop.radius;
    final top = bottom - _root;
    final topHalf = r * 1.3;
    final neck = drop.neckHalf;
    final center = drop.center;
    final dx = r * math.sin(_contact) * drop.scale.width;
    final dy = r * math.cos(_contact) * drop.scale.height;
    final shoulderY = center.dy - dy;
    final midY = bottom + (shoulderY - bottom) * 0.5;

    return Path()
      ..moveTo(cx - topHalf, top)
      ..cubicTo(cx - topHalf * 0.7, midY, cx - neck, midY, cx - dx, shoulderY)
      ..lineTo(cx + dx, shoulderY)
      ..cubicTo(cx + neck, midY, cx + topHalf * 0.7, midY, cx + topHalf, top)
      ..close();
  }

  @override
  bool shouldRepaint(covariant IslandDropPainter old) {
    final a = old.drop;
    final b = drop;
    return old.color != color ||
        a.stub != b.stub ||
        a.scale != b.scale ||
        a.center != b.center ||
        a.island != b.island ||
        a.radius != b.radius ||
        a.neckHalf != b.neckHalf;
  }
}
