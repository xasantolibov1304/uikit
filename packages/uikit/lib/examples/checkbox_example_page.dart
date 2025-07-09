// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/gen/assets.gen.dart';
import 'package:iman_uikit/uikit.dart';

class CheckboxExamplePage extends StatefulWidget {
  const CheckboxExamplePage({super.key});

  @override
  State<CheckboxExamplePage> createState() => _CheckboxExamplePageState();
}

class _CheckboxExamplePageState extends State<CheckboxExamplePage> {
  // Checkbox properties
  bool? _value = false;
  bool _isEnabled = true;
  bool _tristate = false;
  CheckboxSize _size = CheckboxSize.medium;

  // Checkbox card properties
  bool _cardValue = false;
  String _cardTitle = 'Checkbox Card';
  String _cardSubtitle = 'This is a subtitle for the checkbox card';
  bool _cardIsLoading = false;
  bool _showCardSubtitle = true;
  bool _showCardTrailingIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox Preview Section
            _buildSectionTitle('Checkbox Preview'),
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
                  CheckboxWidget(
                    value: _value,
                    onChanged: (value) => setState(() => _value = value),
                    tristate: _tristate,
                    isEnabled: _isEnabled,
                    size: _size,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    _value == null
                        ? 'Indeterminate'
                        : (_value! ? 'Checked' : 'Unchecked'),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Different Checkbox Sizes Preview
            _buildSectionTitle('Different Checkbox Sizes'),
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
                      CheckboxWidget(
                        value: true,
                        onChanged: (value) {},
                        size: CheckboxSize.small,
                      ),
                      const SizedBox(width: 16),
                      const Text('Small Size'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CheckboxWidget(
                        value: true,
                        onChanged: (value) {},
                        size: CheckboxSize.medium,
                      ),
                      const SizedBox(width: 16),
                      const Text('Medium Size'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tristate Checkbox Preview
            _buildSectionTitle('Tristate Checkbox'),
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
                      CheckboxWidget(
                        value: null,
                        onChanged: (value) {},
                        tristate: true,
                      ),
                      const SizedBox(width: 16),
                      const Text('Indeterminate (null)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CheckboxWidget(
                        value: false,
                        onChanged: (value) {},
                        tristate: true,
                      ),
                      const SizedBox(width: 16),
                      const Text('Unchecked (false)'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      CheckboxWidget(
                        value: true,
                        onChanged: (value) {},
                        tristate: true,
                      ),
                      const SizedBox(width: 16),
                      const Text('Checked (true)'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Checkbox Card Preview Section
            _buildSectionTitle('Checkbox Card Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: CheckboxCard(
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

            // Different Checkbox Cards Preview
            _buildSectionTitle('Different Checkbox Cards'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CheckboxCard(
                    title: 'Simple Checkbox Card',
                    value: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  CheckboxCard(
                    title: 'Checkbox Card with Subtitle',
                    subtitle: 'This card has a subtitle',
                    value: false,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  CheckboxCard(
                    title: 'Loading Checkbox Card',
                    subtitle: 'This card is loading',
                    value: true,
                    onChanged: (value) {},
                    isLoading: true,
                  ),
                  const SizedBox(height: 12),
                  CheckboxCard(
                    title: 'Checkbox Card with Icon',
                    subtitle: 'This card has a trailing icon',
                    value: false,
                    onChanged: (value) {},
                    trailingIcon: UikitAssets.icons24.info.svg(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Checkbox Controls Section
            _buildSectionTitle('Checkbox Controls'),
            _buildCheckboxControls(),

            const SizedBox(height: 24),

            // Checkbox Card Controls Section
            _buildSectionTitle('Checkbox Card Controls'),
            _buildCheckboxCardControls(),
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

  Widget _buildCheckboxControls() {
    return Column(
      children: [
        // Size
        _buildDropdownControl<CheckboxSize>(
          label: 'Size',
          value: _size,
          items: CheckboxSize.values,
          onChanged: (value) => setState(() => _size = value!),
          itemBuilder: (size) => size.name.toUpperCase(),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Enabled',
          value: _isEnabled,
          onChanged: (value) => setState(() => _isEnabled = value),
        ),

        _buildSwitchControl(
          label: 'Tristate',
          value: _tristate,
          onChanged: (value) => setState(() => _tristate = value),
        ),
      ],
    );
  }

  Widget _buildCheckboxCardControls() {
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
              value: value,
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
