// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class FieldsExamplePage extends StatefulWidget {
  const FieldsExamplePage({super.key});

  @override
  State<FieldsExamplePage> createState() => _FieldsExamplePageState();
}

class _FieldsExamplePageState extends State<FieldsExamplePage> {
  // InfoField properties
  String _label = 'Field Label';
  String _value = 'Field Value';
  String _suffixValue = 'Suffix';
  String _valueThrough = 'Strikethrough';
  String _suffixValueThrough = 'Suffix Strikethrough';
  String _captionText = 'Caption text';
  bool _isEnabled = true;
  bool _showSuffixValue = true;
  bool _showValueThrough = false;
  bool _showSuffixValueThrough = false;
  bool _showCaptionText = true;
  bool _showLeftIcon = false;
  bool _showRightIcon = false;
  bool _showTrailingIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fields Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InfoField Preview Section
            _buildSectionTitle('InfoField Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: InfoField(
                label: _label,
                value: _value,
                suffixValue: _showSuffixValue ? _suffixValue : null,
                suffixValueThrough:
                    _showSuffixValueThrough ? _suffixValueThrough : null,
                captionText: _showCaptionText ? _captionText : null,
                leftIcon:
                    _showLeftIcon ? Icon(Icons.info, color: Colors.blue) : null,
                trailingIcon: _showTrailingIcon
                    ? Icon(Icons.arrow_forward_ios, color: Colors.grey)
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // Fields Controls Section
            _buildSectionTitle('Fields Controls'),
            _buildFieldsControls(),
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

  Widget _buildFieldsControls() {
    return Column(
      children: [
        // Label
        _buildTextControl(
          label: 'Label',
          value: _label,
          onChanged: (value) => setState(() => _label = value),
        ),

        // Value
        _buildTextControl(
          label: 'Value',
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),

        // Suffix Value
        _buildTextControl(
          label: 'Suffix Value',
          value: _suffixValue,
          onChanged: (value) => setState(() => _suffixValue = value),
        ),

        // Value Through
        _buildTextControl(
          label: 'Value Through',
          value: _valueThrough,
          onChanged: (value) => setState(() => _valueThrough = value),
        ),

        // Suffix Value Through
        _buildTextControl(
          label: 'Suffix Value Through',
          value: _suffixValueThrough,
          onChanged: (value) => setState(() => _suffixValueThrough = value),
        ),

        // Caption Text
        _buildTextControl(
          label: 'Caption Text',
          value: _captionText,
          onChanged: (value) => setState(() => _captionText = value),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Enabled',
          value: _isEnabled,
          onChanged: (value) => setState(() => _isEnabled = value),
        ),

        _buildSwitchControl(
          label: 'Show Suffix Value',
          value: _showSuffixValue,
          onChanged: (value) => setState(() => _showSuffixValue = value),
        ),

        _buildSwitchControl(
          label: 'Show Value Through',
          value: _showValueThrough,
          onChanged: (value) => setState(() => _showValueThrough = value),
        ),

        _buildSwitchControl(
          label: 'Show Suffix Value Through',
          value: _showSuffixValueThrough,
          onChanged: (value) => setState(() => _showSuffixValueThrough = value),
        ),

        _buildSwitchControl(
          label: 'Show Caption Text',
          value: _showCaptionText,
          onChanged: (value) => setState(() => _showCaptionText = value),
        ),

        _buildSwitchControl(
          label: 'Show Left Icon',
          value: _showLeftIcon,
          onChanged: (value) => setState(() => _showLeftIcon = value),
        ),

        _buildSwitchControl(
          label: 'Show Right Icon',
          value: _showRightIcon,
          onChanged: (value) => setState(() => _showRightIcon = value),
        ),

        _buildSwitchControl(
          label: 'Show Trailing Icon',
          value: _showTrailingIcon,
          onChanged: (value) => setState(() => _showTrailingIcon = value),
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
}
