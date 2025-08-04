// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:iman_uikit/uikit.dart' as uikit;

@RoutePage()
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Second Screen',
              style: context.titleTextStyle.large2,
            ),
            const SizedBox(height: 20),
            Text(
              'This is the second screen in the bottom navigation.',
              style: context.bodyTextStyle.main,
            ),
            const SizedBox(height: 20),
            uikit.Button(
              text: 'Example Button',
              onTap: () {
                uikit.showTopSnack(
                  context,
                  uikit.Snack.success('Success', 'Button tapped!'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
