// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class PincodeExamplePage extends StatefulWidget {
  const PincodeExamplePage({super.key});

  @override
  State<PincodeExamplePage> createState() => _PincodeExamplePageState();
}

class _PincodeExamplePageState extends State<PincodeExamplePage> {
  final bool _showBiometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pincode Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Pincode(
          length: 4,
          onCompleted: (pincode) {
            setState(() {});
            _showSnackBar('Pincode completed: $pincode');
          },
          onChanged: (pincode) {
            setState(() {});
          },
          showBiometric: _showBiometric,
          onBiometricTap: () {
            _showSnackBar('Biometric authentication tapped');
          },
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
