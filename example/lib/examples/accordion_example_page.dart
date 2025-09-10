// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class AccordionExamplePage extends StatefulWidget {
  const AccordionExamplePage({super.key});

  @override
  State<AccordionExamplePage> createState() => _AccordionExamplePageState();
}

class _AccordionExamplePageState extends State<AccordionExamplePage> {
  // Accordion properties
  String _title = 'Accordion Title';
  String _content =
      'This is the accordion content. You can put any text or widgets here to demonstrate the accordion functionality.';
  String _buttonText = 'Learn More';
  bool _showButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accordion Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Accordion Preview Section
            _buildSectionTitle('Accordion Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Accordion(
                title: Text(
                  _title,
                  style: context.titleTextStyle.title1.copyWith(
                    color: Colors.black,
                  ),
                ),
                content: Text(
                  _content,
                  style: context.titleTextStyle.title1.copyWith(
                    color: Colors.black,
                  ),
                ),
                buttonText: _showButton ? _buttonText : null,
                onButtonTap:
                    _showButton ? () => _showSnackBar('Button tapped!') : null,
              ),
            ),
            const SizedBox(height: 24),

            // Accordion Controls Section
            _buildSectionTitle('Accordion Controls'),
            _buildAccordionControls(),
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

  Widget _buildAccordionControls() {
    return Column(
      children: [
        // Title
        _buildTextControl(
          label: 'Title',
          value: _title,
          onChanged: (value) => setState(() => _title = value),
        ),

        // Content
        _buildTextControl(
          label: 'Content',
          value: _content,
          onChanged: (value) => setState(() => _content = value),
        ),

        // Button Text
        _buildTextControl(
          label: 'Button Text',
          value: _buttonText,
          onChanged: (value) => setState(() => _buttonText = value),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Show Button',
          value: _showButton,
          onChanged: (value) => setState(() => _showButton = value),
        ),
      ],
    );
  }

  Widget _buildTextControl({
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
