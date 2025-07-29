// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:uikit/buttons_screen.dart';
import 'package:uikit/home_screen.dart';
import 'package:uikit/second_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'ScreenWrapper|Screen|Wrapper,Route')
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true, children: [
          AutoRoute(page: ButtonsRoute.page),
          AutoRoute(page: SecondRoute.page),
        ]),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.material();
}
