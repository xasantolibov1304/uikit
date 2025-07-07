// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class FiltersExamplePage extends StatefulWidget {
  const FiltersExamplePage({super.key});

  @override
  State<FiltersExamplePage> createState() => _FiltersExamplePageState();
}

class _FiltersExamplePageState extends State<FiltersExamplePage> {
  // Filter properties
  String _title = 'Filter';
  int _count = 5;
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filters Preview Section
            _buildSectionTitle('Filters Preview'),
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
                    'Filter Types:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Filter.filter(
                        title: _title,
                        count: _count,
                        isEnabled: _isEnabled,
                        onTap: () => _showSnackBar('Filter tapped!'),
                      ),
                      Filter.tab(
                        title: _title,
                        count: _count,
                        isEnabled: _isEnabled,
                        onTap: () => _showSnackBar('Tab tapped!'),
                      ),
                      Filter.sort(
                        count: _count,
                        isEnabled: _isEnabled,
                        onTap: () => _showSnackBar('Sort tapped!'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Different Count Values:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      Filter.filter(
                        title: 'Small',
                        count: 1,
                        isEnabled: _isEnabled,
                        onTap: () => _showSnackBar('Small filter tapped!'),
                      ),
                      Filter.filter(
                        title: 'Medium',
                        count: 99,
                        isEnabled: _isEnabled,
                        onTap: () => _showSnackBar('Medium filter tapped!'),
                      ),
                      Filter.filter(
                        title: 'Large',
                        count: 1000,
                        isEnabled: _isEnabled,
                        onTap: () => _showSnackBar('Large filter tapped!'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Filters Controls Section
            _buildSectionTitle('Filters Controls'),
            _buildFiltersControls(),
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

  Widget _buildFiltersControls() {
    return Column(
      children: [
        // Title
        _buildTextControl(
          label: 'Title',
          value: _title,
          onChanged: (value) => setState(() => _title = value),
        ),

        // Count
        _buildNumberControl(
          label: 'Count',
          value: _count.toString(),
          onChanged: (value) =>
              setState(() => _count = int.tryParse(value) ?? 0),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Enabled',
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
