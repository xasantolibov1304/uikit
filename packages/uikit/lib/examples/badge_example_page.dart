// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

class BadgeExamplePage extends StatefulWidget {
  const BadgeExamplePage({super.key});

  @override
  State<BadgeExamplePage> createState() => _BadgeExamplePageState();
}

class _BadgeExamplePageState extends State<BadgeExamplePage> {
  // Badge properties
  String _title = 'Badge';
  int _count = 10;
  BadgeWidgetType _type = BadgeWidgetType.primary;
  bool _isEnabled = true;
  bool _showTitle = true;
  bool _showCount = true;
  bool _showLeadingIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge Preview Section
            _buildSectionTitle('Badge Preview'),
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
                  BadgeWidget(
                    title: _showTitle ? _title : null,
                    count: _showCount ? _count : 0,
                    type: _type,
                    isEnabled: _isEnabled,
                    leadingIcon: _showLeadingIcon
                        ? UikitAssets.icons16.filter.svg()
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Different Badge Types Preview
            _buildSectionTitle('Different Badge Types'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: BadgeWidgetType.values.map((type) {
                  return BadgeWidget(
                    title: type.name.toUpperCase(),
                    count: 5,
                    type: type,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),

            // Badge with Icons Preview
            _buildSectionTitle('Badge with Icons'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  BadgeWidget(
                    title: 'Filter',
                    count: 3,
                    type: BadgeWidgetType.primary,
                    leadingIcon: UikitAssets.icons16.filter.svg(),
                  ),
                  BadgeWidget(
                    title: 'Info',
                    count: 7,
                    type: BadgeWidgetType.info,
                    leadingIcon: UikitAssets.icons20.chevronDown.svg(),
                  ),
                  BadgeWidget(
                    title: 'Warning',
                    count: 2,
                    type: BadgeWidgetType.warning,
                    leadingIcon: UikitAssets.icons24.calendar.svg(),
                  ),
                  BadgeWidget(
                    title: 'Success',
                    count: 12,
                    type: BadgeWidgetType.success,
                    leadingIcon: UikitAssets.icons24.checkCircle.svg(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Badge Controls Section
            _buildSectionTitle('Badge Controls'),
            _buildBadgeControls(),
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

  Widget _buildBadgeControls() {
    return Column(
      children: [
        // Type
        _buildDropdownControl<BadgeWidgetType>(
          label: 'Type',
          value: _type,
          items: BadgeWidgetType.values,
          onChanged: (value) => setState(() => _type = value!),
          itemBuilder: (type) => type.name.toUpperCase(),
        ),

        // Title
        _buildTextControl(
          label: 'Title',
          value: _title,
          onChanged: (value) => setState(() => _title = value),
        ),

        // Count
        _buildNumberControl(
          label: 'Count',
          value: _count,
          onChanged: (value) => setState(() => _count = value),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Enabled',
          value: _isEnabled,
          onChanged: (value) => setState(() => _isEnabled = value),
        ),

        _buildSwitchControl(
          label: 'Show Title',
          value: _showTitle,
          onChanged: (value) => setState(() => _showTitle = value),
        ),

        _buildSwitchControl(
          label: 'Show Count',
          value: _showCount,
          onChanged: (value) => setState(() => _showCount = value),
        ),

        _buildSwitchControl(
          label: 'Show Leading Icon',
          value: _showLeadingIcon,
          onChanged: (value) => setState(() => _showLeadingIcon = value),
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

  Widget _buildNumberControl({
    required String label,
    required int value,
    required ValueChanged<int> onChanged,
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
              initialValue: value.toString(),
              keyboardType: TextInputType.number,
              onChanged: (text) {
                final newValue = int.tryParse(text);
                if (newValue != null) {
                  onChanged(newValue);
                }
              },
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
