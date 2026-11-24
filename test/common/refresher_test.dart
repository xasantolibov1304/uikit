// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

// Project imports:
import 'package:uikit/uikit.dart';

const _logoKey = Key('logo');
const _lottieAsset = 'assets/lottie/4prep_logo.json';

/// Serves the example app's Lottie file to widgets under test.
class _TestBundle extends CachingAssetBundle {
  final _bytes = File('example/$_lottieAsset').readAsBytesSync();

  @override
  Future<ByteData> load(String key) async => ByteData.sublistView(Uint8List.fromList(_bytes));
}

Widget _app({
  required Future<void> Function() onRefresh,
  List<ThemeExtension<dynamic>> extensions = const [],
}) {
  return MaterialApp(
    theme: UikitTheme.light(extensions: extensions),
    home: Scaffold(
      body: CommonRefresher(
        onRefresh: onRefresh,
        child: ListView(
          children: const [SizedBox(height: 100, child: Text('item'))],
        ),
      ),
    ),
  );
}

Future<void> _pull(WidgetTester tester) async {
  await tester.fling(find.text('item'), const Offset(0, 400), 1000);
  await tester.pump(); // start drag
  await tester.pump(const Duration(milliseconds: 300)); // settle to loading
}

void main() {
  group('CommonRefresher', () {
    testWidgets('without a logo keeps the standard RefreshIndicator', (tester) async {
      await tester.pumpWidget(_app(onRefresh: () async {}));
      expect(find.byType(RefreshIndicator), findsOneWidget);
      expect(find.byType(LogoLoader), findsNothing);
    });

    testWidgets('with a theme logo shows the animated logo while refreshing', (tester) async {
      final completer = Completer<void>();
      var calls = 0;
      await tester.pumpWidget(
        _app(
          onRefresh: () {
            calls++;
            return completer.future;
          },
          extensions: const [
            UikitRefresherTheme(logo: ColoredBox(key: _logoKey, color: Colors.teal)),
          ],
        ),
      );
      expect(find.byType(RefreshIndicator), findsNothing);

      await _pull(tester);
      expect(calls, 1);
      expect(find.byKey(_logoKey), findsOneWidget);
      final loader = tester.widget<LogoLoader>(find.byType(LogoLoader));
      expect(loader.progress, isNull, reason: 'loading = indeterminate animation');

      // stays visible until onRefresh completes, then hides
      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(LogoLoader), findsOneWidget);
      completer.complete();
      await tester.pumpAndSettle();
      expect(find.byType(LogoLoader), findsNothing);
    });
  });

  group('Dynamic Island', () {
    final iOS = TargetPlatformVariant.only(TargetPlatform.iOS);

    /// A phone in portrait with a status bar of [statusBar] pt.
    void phone(WidgetTester tester, {required double statusBar}) {
      tester.view
        ..devicePixelRatio = 3
        ..physicalSize = const Size(1179, 2556)
        ..viewPadding = FakeViewPadding(top: statusBar * 3)
        ..padding = FakeViewPadding(top: statusBar * 3);
      addTearDown(tester.view.reset);
    }

    testWidgets('iPhone with a Dynamic Island uses IslandRefresher', variant: iOS, (tester) async {
      phone(tester, statusBar: 59);
      await tester.pumpWidget(_app(onRefresh: () async {}));
      expect(find.byType(IslandRefresher), findsOneWidget);
      expect(find.byType(RefreshIndicator), findsNothing);

      final island = tester.widget<IslandRefresher>(find.byType(IslandRefresher)).island;
      expect(island.center.dx, closeTo(1179 / 3 / 2, 1e-9));
      expect(island.width, DynamicIsland.width);
    });

    testWidgets('a notched iPhone keeps the standard indicator', variant: iOS, (tester) async {
      phone(tester, statusBar: 47);
      await tester.pumpWidget(_app(onRefresh: () async {}));
      expect(find.byType(IslandRefresher), findsNothing);
      expect(find.byType(RefreshIndicator), findsOneWidget);
    });

    testWidgets('Android keeps the standard indicator', variant: TargetPlatformVariant.only(TargetPlatform.android),
        (tester) async {
      phone(tester, statusBar: 59);
      await tester.pumpWidget(_app(onRefresh: () async {}));
      expect(find.byType(IslandRefresher), findsNothing);
    });

    testWidgets('landscape keeps the standard indicator', variant: iOS, (tester) async {
      phone(tester, statusBar: 59);
      tester.view.physicalSize = const Size(2556, 1179);
      await tester.pumpWidget(_app(onRefresh: () async {}));
      expect(find.byType(IslandRefresher), findsNothing);
    });

    testWidgets('dynamicIsland: false turns it off', variant: iOS, (tester) async {
      phone(tester, statusBar: 59);
      await tester.pumpWidget(
        _app(onRefresh: () async {}, extensions: const [UikitRefresherTheme(dynamicIsland: false)]),
      );
      expect(find.byType(IslandRefresher), findsNothing);
    });

    testWidgets('the drop loops while refreshing and goes back into the island', variant: iOS, (tester) async {
      phone(tester, statusBar: 59);
      final completer = Completer<void>();
      var calls = 0;
      await tester.pumpWidget(
        _app(
          onRefresh: () {
            calls++;
            return completer.future;
          },
          extensions: const [UikitRefresherTheme(logo: ColoredBox(key: _logoKey, color: Colors.teal))],
        ),
      );

      // A slow pull: iOS bouncing physics springs a fling back too early.
      final gesture = await tester.startGesture(tester.getCenter(find.text('item')));
      for (var i = 0; i < 20; i++) {
        await gesture.moveBy(const Offset(0, 20));
        await tester.pump(const Duration(milliseconds: 16));
      }
      final pulling = tester.widget<LogoLoader>(find.byType(LogoLoader));
      expect(pulling.progress, 1, reason: 'armed: the ring is full');
      await gesture.up();
      for (var i = 0; i < 8; i++) {
        await tester.pump(const Duration(milliseconds: 50)); // spring back, settle, load
      }
      expect(calls, 1);
      final loader = tester.widget<LogoLoader>(find.byType(LogoLoader));
      expect(loader.progress, isNull, reason: 'loading = indeterminate animation');

      await tester.pump(const Duration(seconds: 1));
      expect(find.byType(LogoLoader), findsOneWidget, reason: 'stays until onRefresh completes');

      completer.complete();
      await tester.pumpAndSettle();
      expect(find.byType(LogoLoader), findsNothing);
    });
  });

  group('LogoLoader', () {
    final theme = UikitTheme.light();

    Future<void> pumpLoader(WidgetTester tester, double? progress) => tester.pumpWidget(
          MaterialApp(
            theme: theme,
            home: Center(
              child: LogoLoader(
                logo: const ColoredBox(key: _logoKey, color: Colors.teal),
                progress: progress,
              ),
            ),
          ),
        );

    testWidgets('determinate progress renders without animating', (tester) async {
      await pumpLoader(tester, 0.5);
      expect(find.byKey(_logoKey), findsOneWidget);
      expect(tester.hasRunningAnimations, isFalse);
    });

    testWidgets('indeterminate loops until progress is set', (tester) async {
      await pumpLoader(tester, null);
      expect(tester.hasRunningAnimations, isTrue);
      await pumpLoader(tester, 1);
      await tester.pump();
      expect(tester.hasRunningAnimations, isFalse);
    });
  });

  group('LottieLoader', () {
    final theme = UikitTheme.light();

    Future<void> pumpLottie(WidgetTester tester, Widget child) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: _TestBundle(),
          child: MaterialApp(theme: theme, home: Center(child: child)),
        ),
      );
      // let Lottie load and decode the composition
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
      await tester.pump();
    }

    double controllerValue(WidgetTester tester) =>
        (tester.widget<Lottie>(find.byType(Lottie)).controller! as AnimationController).value;

    testWidgets('pull progress scrubs to progress * pullEnd', (tester) async {
      await pumpLottie(tester, const LottieLoader(asset: _lottieAsset, pullEnd: 0.5, progress: 0.6));
      expect(controllerValue(tester), closeTo(0.3, 1e-9));
      expect(tester.hasRunningAnimations, isFalse);
    });

    testWidgets('loading loops', (tester) async {
      await pumpLottie(tester, const LottieLoader(asset: _lottieAsset));
      expect(tester.hasRunningAnimations, isTrue);
      final before = controllerValue(tester);
      await tester.pump(const Duration(milliseconds: 500));
      expect(controllerValue(tester), isNot(before));
    });

    Future<TestGesture> dragWithoutRelease(WidgetTester tester, UikitRefresherTheme style) async {
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: _TestBundle(),
          child: _app(onRefresh: () async {}, extensions: [style]),
        ),
      );
      final gesture = await tester.startGesture(tester.getCenter(find.text('item')));
      for (var i = 0; i < 4; i++) {
        await gesture.moveBy(const Offset(0, 15));
        await tester.pump();
      }
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 200)));
      await tester.pump();
      return gesture;
    }

    testWidgets('Lottie already plays while the user is still pulling', (tester) async {
      final gesture = await dragWithoutRelease(
        tester,
        const UikitRefresherTheme(lottieAsset: _lottieAsset),
      );
      final loader = tester.widget<LottieLoader>(find.byType(LottieLoader));
      expect(loader.progress, isNull, reason: 'loops during the drag, before release');
      final before = controllerValue(tester);
      await tester.pump(const Duration(milliseconds: 300));
      expect(controllerValue(tester), isNot(before));
      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('lottieScrubOnPull follows the finger instead', (tester) async {
      final gesture = await dragWithoutRelease(
        tester,
        const UikitRefresherTheme(lottieAsset: _lottieAsset, lottieScrubOnPull: true, lottiePullEnd: 0.5),
      );
      final loader = tester.widget<LottieLoader>(find.byType(LottieLoader));
      expect(loader.progress, isNotNull);
      expect(loader.progress, greaterThan(0));
      await gesture.up();
      await tester.pumpAndSettle();
    });

    testWidgets('refresher uses the theme Lottie while refreshing', (tester) async {
      final completer = Completer<void>();
      await tester.pumpWidget(
        DefaultAssetBundle(
          bundle: _TestBundle(),
          child: _app(
            onRefresh: () => completer.future,
            extensions: const [UikitRefresherTheme(lottieAsset: _lottieAsset, lottiePullEnd: 0.5)],
          ),
        ),
      );
      await _pull(tester);
      final loader = tester.widget<LottieLoader>(find.byType(LottieLoader));
      expect(loader.progress, isNull);
      expect(loader.pullEnd, 0.5);
      expect(find.byType(LogoLoader), findsNothing);
      completer.complete();
      await tester.pumpAndSettle();
      expect(find.byType(LottieLoader), findsNothing);
    });
  });
}
