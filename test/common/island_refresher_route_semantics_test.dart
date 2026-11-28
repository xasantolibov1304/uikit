// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:uikit/uikit.dart';

/// Profile-like tab: a refresher list with a button that opens another route.
class _Tab extends StatelessWidget {
  const _Tab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarInternal(title: 'Profile', canPop: false, automaticallyImplyLeading: false),
      body: SafeArea(
        child: CommonRefresher(
          onRefresh: () => Future<void>.delayed(const Duration(milliseconds: 300)),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Edit')),
                      body: TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Back')),
                    ),
                  ),
                ),
                child: const Text('Edit profile'),
              ),
              for (var i = 0; i < 30; i++) ListTile(title: Text('Row $i')),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('scrolling after a route was pushed and popped keeps the semantics tree valid', (tester) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    final semantics = tester.ensureSemantics();
    tester.view.physicalSize = const Size(402 * 3, 874 * 3);
    tester.view.devicePixelRatio = 3;
    tester.view.viewPadding = const FakeViewPadding(top: 62 * 3, bottom: 34 * 3);
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp(theme: UikitTheme.light(), home: const _Tab()));
    expect(find.byType(IslandRefresher), findsOneWidget);

    Future<void> frames(int n) async {
      for (var i = 0; i < n; i++) {
        await tester.pump(const Duration(milliseconds: 16));
      }
    }

    for (var round = 0; round < 3; round++) {
      await tester.tap(find.text('Edit profile'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Back'));
      await tester.pumpAndSettle();

      // Scroll down from the top, as a finger would.
      final gesture = await tester.startGesture(const Offset(200, 600));
      for (var i = 0; i < 25; i++) {
        await gesture.moveBy(const Offset(0, -20));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await gesture.up();
      await frames(60);
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'round $round');

      // Back to the top for the next round.
      await tester.fling(find.byType(ListView), const Offset(0, 2000), 4000);
      await tester.pumpAndSettle();
    }

    semantics.dispose();
    debugDefaultTargetPlatformOverride = null;
  });
}
