// Flutter imports:
import 'package:flutter/material.dart' hide BottomNavigationBarItem;

// Project imports:
import 'package:iman_uikit/common/gesture_detector.dart';
import 'package:iman_uikit/components/bottom_nav_bar/bottom_nav_bar_item.dart';
import 'package:iman_uikit/components/indicators/badge_indicator.dart';
import 'package:iman_uikit/theme/app_typography_theme_data.dart';
import 'package:iman_uikit/theme/color_theme_data.dart';

const _tabBarHeight = 60.0;

class CommonBottomNavigationBar extends StatefulWidget {
  const CommonBottomNavigationBar({
    required this.itemBuilder,
    required this.currentIndex,
    required this.onTap,
    this.onLongPress,
    super.key,
  });

  final BottomNavBarItemBuilder itemBuilder;
  final int currentIndex;

  final void Function(int) onTap;
  final void Function(int)? onLongPress;

  @override
  State<CommonBottomNavigationBar> createState() =>
      _CommonBottomNavigationBarState();
}

class _CommonBottomNavigationBarState extends State<CommonBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  late final List<BottomNavBarItem> _items;

  @override
  void initState() {
    _items = widget.itemBuilder(context);
    controller = TabController(
      length: _items.length,
      vsync: this,
      initialIndex: widget.currentIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: context.surfaceColors.primary,
            ),
          ),
        ),
        child: TabBar(
          tabs: _items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = index == widget.currentIndex;

            return Tab(
              text: item.label,
              height: _tabBarHeight,
              iconMargin: const EdgeInsets.only(bottom: 6),
              icon: BadgeIndicator(
                count: item.badgeCount,
                type: BadgeIndicatorType.info,
                child: CommonGestureDetector(
                  onLongPress: () {
                    widget.onLongPress?.call(index);
                  },
                  child: isSelected ? item.activeIcon : item.inactiveIcon,
                ),
              ),
            );
          }).toList(),
          onTap: (index) {
            if (index < _items.length) {
              widget.onTap(index);
            }
          },
          controller: controller,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: context.textColors.primary,
          unselectedLabelColor: context.textColors.secondary,
          overlayColor: WidgetStateProperty.all(
            context.surfaceColors.secondary.withValues(alpha: 0.1),
          ),
          labelStyle: context.buttonTextStyle.subtext.medium,
          unselectedLabelStyle: context.buttonTextStyle.subtext.copyWith(
            color: context.textColors.secondary,
          ),
        ),
      ),
    );
  }
}
