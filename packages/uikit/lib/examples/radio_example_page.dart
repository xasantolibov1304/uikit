// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

class RadioExamplePage extends StatefulWidget {
  const RadioExamplePage({super.key});

  @override
  State<RadioExamplePage> createState() => _RadioExamplePageState();
}

class _RadioExamplePageState extends State<RadioExamplePage> {
  // Radio properties
  bool _value = false;
  bool _isEnabled = true;

  // Radio card properties
  bool _cardValue = false;
  String _cardTitle = 'Radio Card';
  String _cardSubtitle = 'This is a subtitle for the radio card';
  bool _showCardSubtitle = true;
  bool _cardIsLoading = false;
  bool _showCardTrailingIcon = false;

  // Radio group state
  int _selectedRadioIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radio Buttons Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Radio Preview Section
            _buildSectionTitle('Radio Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioWidget(
                    value: _value,
                    onChanged: (value) => setState(() => _value = value),
                    isEnabled: _isEnabled,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    _value ? 'Selected' : 'Unselected',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Different Radio States Preview
            _buildSectionTitle('Different Radio States'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      RadioWidget(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const SizedBox(width: 16),
                      const Text('Selected (Enabled)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      RadioWidget(
                        value: false,
                        onChanged: (value) {},
                      ),
                      const SizedBox(width: 16),
                      const Text('Unselected (Enabled)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      RadioWidget(
                        value: true,
                        onChanged: (value) {},
                        isEnabled: false,
                      ),
                      const SizedBox(width: 16),
                      const Text('Selected (Disabled)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      RadioWidget(
                        value: false,
                        onChanged: (value) {},
                        isEnabled: false,
                      ),
                      const SizedBox(width: 16),
                      const Text('Unselected (Disabled)'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Radio Group Example
            _buildSectionTitle('Radio Group Example'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildRadioOption('Option 1', 0),
                  const SizedBox(height: 12),
                  _buildRadioOption('Option 2', 1),
                  const SizedBox(height: 12),
                  _buildRadioOption('Option 3', 2),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Radio Card Preview Section
            _buildSectionTitle('Radio Card Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: RadioCard(
                title: _cardTitle,
                subtitle: _showCardSubtitle ? _cardSubtitle : null,
                value: _cardValue,
                onChanged: (value) =>
                    setState(() => _cardValue = value ?? false),
                isLoading: _cardIsLoading,
                trailingIcon: _showCardTrailingIcon
                    ? UikitAssets.icons24.info.svg()
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // Different Radio Cards Preview
            _buildSectionTitle('Different Radio Cards'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  RadioCard(
                    title: 'Simple Radio Card',
                    value: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  RadioCard(
                    title: 'Radio Card with Subtitle',
                    subtitle: 'This card has a subtitle',
                    value: false,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  RadioCard(
                    title: 'Loading Radio Card',
                    subtitle: 'This card is loading',
                    value: true,
                    onChanged: (value) {},
                    isLoading: true,
                  ),
                  const SizedBox(height: 12),
                  RadioCard(
                    title: 'Radio Card with Icon',
                    subtitle: 'This card has a trailing icon',
                    value: false,
                    onChanged: (value) {},
                    trailingIcon: UikitAssets.icons24.info.svg(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Radio Controls Section
            _buildSectionTitle('Radio Controls'),
            _buildRadioControls(),

            const SizedBox(height: 24),

            // Radio Card Controls Section
            _buildSectionTitle('Radio Card Controls'),
            _buildRadioCardControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String title, int value) {
    return Row(
      children: [
        RadioWidget(
          value: _selectedRadioIndex == value,
          onChanged: (selected) {
            if (selected) {
              setState(() => _selectedRadioIndex = value);
            }
          },
        ),
        const SizedBox(width: 16),
        Text(title),
      ],
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

  Widget _buildRadioControls() {
    return Column(
      children: [
        // Boolean controls
        _buildSwitchControl(
          label: 'Enabled',
          value: _isEnabled,
          onChanged: (value) => setState(() => _isEnabled = value),
        ),
      ],
    );
  }

  Widget _buildRadioCardControls() {
    return Column(
      children: [
        // Title
        _buildTextControl(
          label: 'Title',
          value: _cardTitle,
          onChanged: (value) => setState(() => _cardTitle = value),
        ),

        // Subtitle
        _buildTextControl(
          label: 'Subtitle',
          value: _cardSubtitle,
          onChanged: (value) => setState(() => _cardSubtitle = value),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Show Subtitle',
          value: _showCardSubtitle,
          onChanged: (value) => setState(() => _showCardSubtitle = value),
        ),

        _buildSwitchControl(
          label: 'Show Trailing Icon',
          value: _showCardTrailingIcon,
          onChanged: (value) => setState(() => _showCardTrailingIcon = value),
        ),

        _buildSwitchControl(
          label: 'Loading',
          value: _cardIsLoading,
          onChanged: (value) => setState(() => _cardIsLoading = value),
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
