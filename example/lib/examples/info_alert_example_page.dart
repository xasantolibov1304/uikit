// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class InfoAlertExamplePage extends StatefulWidget {
  const InfoAlertExamplePage({super.key});

  @override
  State<InfoAlertExamplePage> createState() => _InfoAlertExamplePageState();
}

class _InfoAlertExamplePageState extends State<InfoAlertExamplePage> {
  // InfoAlert properties
  InfoAlertType _iconType = InfoAlertType.neutral;
  String _title = 'Info Alert Title';
  String _description =
      'This is an info alert description with some additional text to demonstrate the component functionality.';
  bool _showTitle = true;
  bool _showDescription = true;
  bool _showDismiss = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Alert Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InfoAlert Preview Section
            _buildSectionTitle('Info Alert Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: InfoAlert(
                title: _showTitle ? _title : null,
                description: _showDescription ? _description : null,
                iconType: _iconType,
                onDismiss: _showDismiss
                    ? () => _showSnackBar('Info Alert dismissed!')
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // InfoAlert Controls Section
            _buildSectionTitle('Info Alert Controls'),
            _buildInfoAlertControls(),
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

  Widget _buildInfoAlertControls() {
    return Column(
      children: [
        // Icon Type
        _buildDropdownControl<InfoAlertType>(
          label: 'Icon Type',
          value: _iconType,
          items: InfoAlertType.values,
          onChanged: (value) => setState(() => _iconType = value!),
          itemBuilder: (type) => type.name.toUpperCase(),
        ),

        const SizedBox(height: 16),

        // Title
        _buildTextFieldControl(
          label: 'Title',
          value: _title,
          onChanged: (value) => setState(() => _title = value),
          enabled: _showTitle,
        ),

        // Description
        _buildTextFieldControl(
          label: 'Description',
          value: _description,
          onChanged: (value) => setState(() => _description = value),
          enabled: _showDescription,
          maxLines: 3,
        ),

        const SizedBox(height: 16),

        // Visibility Controls
        _buildSectionTitle('Visibility Controls'),
        _buildSwitchControl(
          label: 'Show Title',
          value: _showTitle,
          onChanged: (value) => setState(() => _showTitle = value),
        ),
        _buildSwitchControl(
          label: 'Show Description',
          value: _showDescription,
          onChanged: (value) => setState(() => _showDescription = value),
        ),
        _buildSwitchControl(
          label: 'Show Dismiss Button',
          value: _showDismiss,
          onChanged: (value) => setState(() => _showDismiss = value),
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
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldControl({
    required String label,
    required String value,
    required ValueChanged<String> onChanged,
    required bool enabled,
    int maxLines = 1,
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
          TextField(
            controller: TextEditingController(text: value),
            onChanged: onChanged,
            enabled: enabled,
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
      padding: const EdgeInsets.only(bottom: 12),
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
