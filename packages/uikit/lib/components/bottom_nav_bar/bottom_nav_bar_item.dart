// Flutter imports:
import 'package:flutter/material.dart';

typedef BottomNavBarItemBuilder = List<BottomNavBarItem> Function(
  BuildContext context,
);

class BottomNavBarItem {
  const BottomNavBarItem({
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
    this.badgeCount = 0,
  });

  final Widget activeIcon;
  final Widget inactiveIcon;
  final String label;

  final int badgeCount;
}
