// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class DropdownsExamplePage extends StatefulWidget {
  const DropdownsExamplePage({super.key});

  @override
  State<DropdownsExamplePage> createState() => _DropdownsExamplePageState();
}

class _DropdownsExamplePageState extends State<DropdownsExamplePage> {
  // Dropdown properties
  String? _selectedValue;
  List<String> _dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5'
  ];
  bool _isEnabled = true;
  double _maxHeight = 320.0;
  EdgeInsets _menuPadding = const EdgeInsets.symmetric(vertical: 4);

  // Custom dropdown items
  final List<String> _customItems = [
    'Apple',
    'Banana',
    'Orange',
    'Grape',
    'Mango',
    'Pineapple'
  ];
  String? _customSelectedValue;

  // Countries dropdown
  final List<String> _countries = [
    'USA',
    'Canada',
    'UK',
    'Germany',
    'France',
    'Japan',
    'Australia'
  ];
  String? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarInternal(
        title: 'Dropdowns Example',
        centerTitle: true,
        backgroundColor: context.surfaceColors.error,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Dropdown Preview Section
            _buildSectionTitle('Basic Dropdown Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected: ${_selectedValue ?? 'None'}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  CommonDropdown(
                    items: _dropdownItems,
                    onValueChanged: (value) =>
                        setState(() => _selectedValue = value),
                    isEnabled: _isEnabled,
                    maxHeight: _maxHeight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedValue ?? 'Select an option',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Custom Dropdown Section
            _buildSectionTitle('Custom Dropdown'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Fruit: ${_customSelectedValue ?? 'None'}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  CommonDropdown(
                    items: _customItems,
                    onValueChanged: (value) =>
                        setState(() => _customSelectedValue = value),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.apple,
                                color: Colors.orange.shade600,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _customSelectedValue ?? 'Select a fruit',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.orange.shade800,
                                    ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.orange.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Countries Dropdown Section
            _buildSectionTitle('Countries Dropdown'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Country: ${_selectedCountry ?? 'None'}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  CommonDropdown(
                    items: _countries,
                    onValueChanged: (value) =>
                        setState(() => _selectedCountry = value),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.public,
                                color: Colors.blue.shade600,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _selectedCountry ?? 'Select a country',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Colors.blue.shade800,
                                    ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Dropdowns with Different Width and Height
            _buildSectionTitle('Dropdowns with Different Width and Height'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Small Width Dropdown
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CommonDropdown(
                          items: ['Option 1', 'Option 2', 'Option 3'],
                          onValueChanged: (value) => debugPrint('Small Width: $value'),
                          minWidth: 120,
                          maxHeight: 200,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Small',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey.shade600,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Medium Width Dropdown
                      Expanded(
                        flex: 2,
                        child: CommonDropdown(
                          items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
                          onValueChanged: (value) => debugPrint('Medium Width: $value'),
                          minWidth: 200,
                          maxHeight: 250,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Medium Width',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey.shade600,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Large Width Dropdown
                  CommonDropdown(
                    items: ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'],
                    onValueChanged: (value) => debugPrint('Large Width: $value'),
                    minWidth: 300,
                    maxHeight: 300,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Large Width Dropdown',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey.shade600,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Different Heights Row
                  Row(
                    children: [
                      // Short Height Dropdown
                      Expanded(
                        child: CommonDropdown(
                          items: ['A', 'B', 'C'],
                          onValueChanged: (value) => debugPrint('Short Height: $value'),
                          maxHeight: 150,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.green.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Short',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.green.shade700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.green.shade600,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Tall Height Dropdown
                      Expanded(
                        child: CommonDropdown(
                          items: ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7'],
                          onValueChanged: (value) => debugPrint('Tall Height: $value'),
                          maxHeight: 400,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.purple.shade50,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.purple.shade300),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tall',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.purple.shade700,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.purple.shade600,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Dropdowns Controls Section
            _buildSectionTitle('Dropdowns Controls'),
            _buildDropdownsControls(),
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

  Widget _buildDropdownsControls() {
    return Column(
      children: [
        // Dropdown Items
        _buildTextControl(
          label: 'Dropdown Items (comma separated)',
          value: _dropdownItems.join(', '),
          onChanged: (value) {
            setState(() {
              _dropdownItems = value
                  .split(',')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList();
            });
          },
        ),

        // Selected Value
        _buildTextControl(
          label: 'Selected Value',
          value: _selectedValue ?? '',
          onChanged: (value) =>
              setState(() => _selectedValue = value.isEmpty ? null : value),
        ),

        // Max Height
        _buildSliderControl(
          label: 'Max Height',
          value: _maxHeight,
          min: 100.0,
          max: 500.0,
          onChanged: (value) => setState(() => _maxHeight = value),
        ),

        // Menu Padding
        _buildDropdownControl<String>(
          label: 'Menu Padding',
          value: _getPaddingString(_menuPadding),
          items: ['None', 'Small', 'Medium', 'Large'],
          onChanged: (value) {
            setState(() {
              _menuPadding = _getPaddingFromString(value!);
            });
          },
          itemBuilder: (padding) => padding,
        ),

        // Is Enabled
        _buildSwitchControl(
          label: 'Is Enabled',
          value: _isEnabled,
          onChanged: (value) => setState(() => _isEnabled = value),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          TextFormField(
            initialValue: value,
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliderControl({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                value.toStringAsFixed(0),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Slider(
            value: value,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ],
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<T>(
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  String _getPaddingString(EdgeInsets padding) {
    if (padding == EdgeInsets.zero) return 'None';
    if (padding == const EdgeInsets.symmetric(vertical: 2)) return 'Small';
    if (padding == const EdgeInsets.symmetric(vertical: 4)) return 'Medium';
    if (padding == const EdgeInsets.symmetric(vertical: 8)) return 'Large';
    return 'None';
  }

  EdgeInsets _getPaddingFromString(String padding) {
    switch (padding) {
      case 'Small':
        return const EdgeInsets.symmetric(vertical: 2);
      case 'Medium':
        return const EdgeInsets.symmetric(vertical: 4);
      case 'Large':
        return const EdgeInsets.symmetric(vertical: 8);
      default:
        return EdgeInsets.zero;
    }
  }
}
