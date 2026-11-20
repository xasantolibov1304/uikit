// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:uikit/uikit.dart';

/// Pull-to-refresh with the Lottie logo (set via UikitRefresherTheme in main.dart)
/// and the LottieLoader states.
class RefresherExamplePage extends StatefulWidget {
  const RefresherExamplePage({super.key});

  @override
  State<RefresherExamplePage> createState() => _RefresherExamplePageState();
}

class _RefresherExamplePageState extends State<RefresherExamplePage> {
  int _refreshCount = 0;
  double _progress = 0.6;

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _refreshCount++);
  }

  @override
  Widget build(BuildContext context) {
    const lottie = 'assets/lottie/4prep_logo.json';

    return Scaffold(
      appBar: AppBar(title: const Text('Refresher')),
      body: CommonRefresher(
        onRefresh: _onRefresh,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Pull down to refresh', style: context.titleTextStyle.title2),
            const SizedBox(height: 4),
            Text('Refreshed $_refreshCount times', style: context.baseTextStyle.base3),
            const SizedBox(height: 32),
            Text('LottieLoader — loading', style: context.titleTextStyle.title4),
            const SizedBox(height: 12),
            const Center(child: LottieLoader(asset: lottie, size: 64)),
            const SizedBox(height: 32),
            Text('LottieLoader — pull progress', style: context.titleTextStyle.title4),
            const SizedBox(height: 12),
            Center(
              child: LottieLoader(asset: lottie, size: 64, pullEnd: 0.5, progress: _progress),
            ),
            Slider(
              value: _progress,
              onChanged: (value) => setState(() => _progress = value),
            ),
            for (var i = 1; i <= 10; i++)
              ListTile(title: Text('Item $i', style: context.baseTextStyle.base2)),
          ],
        ),
      ),
    );
  }
}
