// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/components/breadcrumb/breadcrumb.dart';

class BreadcrumbExamplePage extends StatefulWidget {
  const BreadcrumbExamplePage({super.key});

  @override
  State<BreadcrumbExamplePage> createState() => _BreadcrumbExamplePageState();
}

class _BreadcrumbExamplePageState extends State<BreadcrumbExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Breadcrumb Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Breadcrumb.builder(
              labels: const [
                'First Item',
                'Second Item',
                'Third Item',
                'Fourth Item',
                'Fifth Item',
                'Active Item',
              ],
              initialActive: 1,
              onChanged: (index) {},
            ),
          ],
        ),
      ),
    );
  }
}
