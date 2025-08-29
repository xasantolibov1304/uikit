// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:iman_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:uikit_example/router/app_router.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: context.surfaceColors.primary,
      appBarBuilder: (context, tabsRouter) => uikit.AppBarInternal(
        title: 'UIKit Demo',
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: context.surfaceColors.primary,
      ),
      transitionBuilder: (_, Widget child, __) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: child,
        );
      },
      routes: [
        ButtonsRoute(),
        SecondRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => uikit.CommonBottomNavigationBar(
        itemBuilder: (context) => [
          uikit.BottomNavBarItem(
            label: 'Buttons',
            activeIcon: const Icon(Icons.widgets),
            inactiveIcon: const Icon(Icons.widgets_outlined),
          ),
          uikit.BottomNavBarItem(
            label: 'Brand Colors',
            activeIcon: const Icon(Icons.palette),
            inactiveIcon: const Icon(Icons.palette_outlined),
          ),
        ],
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) => tabsRouter.setActiveIndex(index),
      ),
    );
  }
}
