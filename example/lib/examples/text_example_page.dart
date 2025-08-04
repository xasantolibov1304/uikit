// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class TextExamplePage extends StatefulWidget {
  const TextExamplePage({super.key});

  @override
  State<TextExamplePage> createState() => _TextExamplePageState();
}

class _TextExamplePageState extends State<TextExamplePage> {
  // Text properties
  String _text =
      'This is a sample text with detailed information for the "TextWidget" component. This text demonstrates how the component handles long content and provides expand/collapse functionality. You can customize various properties like max lines, button text, and styling.';
  String _startButtonText = 'Show More';
  String _endButtonText = 'Show Less';
  int _maxLines = 3;
  bool _isCollapsed = true;
  bool _showStartButton = true;
  bool _showEndButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text Preview Section
            _buildSectionTitle('Text Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextWidget(
                text: _text,
                maxLines: _maxLines,
                isCollapsed: _isCollapsed,
                startButtonText: _showStartButton ? _startButtonText : null,
                endButtonText: _showEndButton ? _endButtonText : null,
              ),
            ),
            const SizedBox(height: 24),

            // Text Controls Section
            _buildSectionTitle('Text Controls'),
            _buildTextControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildTextControls() {
    return Column(
      children: [
        // Text
        _buildTextControl(
          label: 'Text',
          value: _text,
          onChanged: (value) => setState(() => _text = value),
          maxLines: 3,
        ),

        // Start Button Text
        _buildTextControl(
          label: 'Start Button',
          value: _startButtonText,
          onChanged: (value) => setState(() => _startButtonText = value),
        ),

        // End Button Text
        _buildTextControl(
          label: 'End Button',
          value: _endButtonText,
          onChanged: (value) => setState(() => _endButtonText = value),
        ),

        // Max Lines
        _buildNumberControl(
          label: 'Max Lines',
          value: _maxLines.toString(),
          onChanged: (value) =>
              setState(() => _maxLines = int.tryParse(value) ?? 3),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Collapsed',
          value: _isCollapsed,
          onChanged: (value) => setState(() => _isCollapsed = value),
        ),

        _buildSwitchControl(
          label: 'Show Start Button',
          value: _showStartButton,
          onChanged: (value) => setState(() => _showStartButton = value),
        ),

        _buildSwitchControl(
          label: 'Show End Button',
          value: _showEndButton,
          onChanged: (value) => setState(() => _showEndButton = value),
        ),
      ],
    );
  }

  Widget _buildTextControl({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: value,
              onChanged: onChanged,
              maxLines: maxLines,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberControl({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: value,
              onChanged: onChanged,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchControl({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
