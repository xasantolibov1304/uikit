// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class ButtonsExamplePage extends StatefulWidget {
  const ButtonsExamplePage({super.key});

  @override
  State<ButtonsExamplePage> createState() => _ButtonsExamplePageState();
}

class _ButtonsExamplePageState extends State<ButtonsExamplePage> {
  // Button properties
  ButtonType _buttonType = ButtonType.primary;
  ButtonSize _buttonSize = ButtonSize.large;
  String _buttonText = 'Button Text';
  String? _subtext;
  int? _count;
  bool _isLoading = false;
  bool _showText = true;
  bool _showSubtext = false;
  bool _enable = true;
  double? _width;
  bool _showIconStart = false;
  bool _showIconEnd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Button Preview Section
            _buildSectionTitle('Button Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Button(
                text: _buttonText,
                onTap: () => _showSnackBar('Button tapped!'),
                type: _buttonType,
                size: _buttonSize,
                subtext: _subtext,
                count: _count,
                isLoading: _isLoading,
                showText: _showText,
                showSubtext: _showSubtext,
                isEnabled: _enable,
                width: _width,
                iconStart: _showIconStart
                    ? Icon(Icons.refresh_rounded,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black)
                    : null,
                iconEnd: _showIconEnd
                    ? Icon(Icons.arrow_forward_ios,
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.white
                            : Colors.black)
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // Button Controls Section
            _buildSectionTitle('Button Controls'),
            _buildButtonControls(),
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

  Widget _buildButtonControls() {
    return Column(
      children: [
        // Button Type
        _buildDropdownControl<ButtonType>(
          label: 'Button Type',
          value: _buttonType,
          items: ButtonType.values,
          onChanged: (value) => setState(() => _buttonType = value!),
          itemBuilder: (type) => type.name.toUpperCase(),
        ),

        // Button Size
        _buildDropdownControl<ButtonSize>(
          label: 'Button Size',
          value: _buttonSize,
          items: ButtonSize.values,
          onChanged: (value) => setState(() => _buttonSize = value!),
          itemBuilder: (size) => size.name.toUpperCase(),
        ),

        // Button Text
        _buildTextControl(
          label: 'Button Text',
          value: _buttonText,
          onChanged: (value) => setState(() => _buttonText = value),
        ),

        // Subtext
        _buildTextControl(
          label: 'Subtext',
          value: _subtext ?? '',
          onChanged: (value) =>
              setState(() => _subtext = value.isEmpty ? null : value),
        ),

        // Count
        _buildNumberControl(
          label: 'Count',
          value: _count?.toString() ?? '',
          onChanged: (value) => setState(
              () => _count = value.isEmpty ? null : int.tryParse(value)),
        ),

        // Width
        _buildNumberControl(
          label: 'Width',
          value: _width?.toString() ?? '',
          onChanged: (value) => setState(
              () => _width = value.isEmpty ? null : double.tryParse(value)),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Loading',
          value: _isLoading,
          onChanged: (value) => setState(() => _isLoading = value),
        ),

        _buildSwitchControl(
          label: 'Show Text',
          value: _showText,
          onChanged: (value) => setState(() => _showText = value),
        ),

        _buildSwitchControl(
          label: 'Show Subtext',
          value: _showSubtext,
          onChanged: (value) => setState(() => _showSubtext = value),
        ),

        _buildSwitchControl(
          label: 'Enable',
          value: _enable,
          onChanged: (value) => setState(() => _enable = value),
        ),

        _buildSwitchControl(
          label: 'Show Start Icon',
          value: _showIconStart,
          onChanged: (value) => setState(() => _showIconStart = value),
        ),

        _buildSwitchControl(
          label: 'Show End Icon',
          value: _showIconEnd,
          onChanged: (value) => setState(() => _showIconEnd = value),
        ),
      ],
    );
  }

  Widget _buildDropdownControl<T>({
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
    required String Function(T) itemBuilder,
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
            child: DropdownButtonFormField<T>(
              initialValue: value,
              items: items.map((item) {
                return DropdownMenuItem<T>(
                  value: item,
                  child: Text(itemBuilder(item)),
                );
              }).toList(),
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
