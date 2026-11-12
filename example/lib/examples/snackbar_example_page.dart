// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class SnackbarExamplePage extends StatefulWidget {
  const SnackbarExamplePage({super.key});

  @override
  State<SnackbarExamplePage> createState() => _SnackbarExamplePageState();
}

class _SnackbarExamplePageState extends State<SnackbarExamplePage> {
  String _selectedSnackType = 'Neutral';
  String _title = 'Snackbar Title';
  String _message = 'This is a sample message for the snackbar.';
  bool _showMessage = true;

  final List<String> _snackTypes = [
    'Neutral',
    'Success',
    'Warning',
    'Error',
    'Info',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Snackbar Preview Section
            _buildSectionTitle('Snackbar Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Selected Type: $_selectedSnackType',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Title: $_title',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (_showMessage) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Message: $_message',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _showSnackbar(),
                    child: const Text('Show Snackbar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Different Snackbar Types Section
            _buildSectionTitle('Different Snackbar Types'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildSnackTypeButton(
                      'Neutral', () => _showSnackbarByType('Neutral')),
                  const SizedBox(height: 12),
                  _buildSnackTypeButton(
                      'Success', () => _showSnackbarByType('Success')),
                  const SizedBox(height: 12),
                  _buildSnackTypeButton(
                      'Warning', () => _showSnackbarByType('Warning')),
                  const SizedBox(height: 12),
                  _buildSnackTypeButton(
                      'Error', () => _showSnackbarByType('Error')),
                  const SizedBox(height: 12),
                  _buildSnackTypeButton(
                      'Info', () => _showSnackbarByType('Info')),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Snackbar Controls Section
            _buildSectionTitle('Snackbar Controls'),
            _buildSnackbarControls(),
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

  Widget _buildSnackTypeButton(String type, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getSnackTypeColor(type),
          foregroundColor: Colors.white,
        ),
        child: Text('Show $type Snackbar'),
      ),
    );
  }

  Color _getSnackTypeColor(String type) {
    switch (type) {
      case 'Success':
        return Colors.green;
      case 'Warning':
        return Colors.orange;
      case 'Error':
        return Colors.red;
      case 'Info':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  Widget _buildSnackbarControls() {
    return Column(
      children: [
        // Snack Type
        _buildDropdownControl<String>(
          label: 'Snack Type',
          value: _selectedSnackType,
          items: _snackTypes,
          onChanged: (value) => setState(() => _selectedSnackType = value!),
          itemBuilder: (type) => type,
        ),

        // Title
        _buildTextControl(
          label: 'Title',
          value: _title,
          onChanged: (value) => setState(() => _title = value),
        ),

        // Message
        _buildTextControl(
          label: 'Message',
          value: _message,
          onChanged: (value) => setState(() => _message = value),
        ),

        // Show Message
        _buildSwitchControl(
          label: 'Show Message',
          value: _showMessage,
          onChanged: (value) => setState(() => _showMessage = value),
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

  void _showSnackbar() {
    final snack = _createSnack();
    showTopSnack(context, snack);
  }

  void _showSnackbarByType(String type) {
    final snack = _createSnackByType(type);
    showTopSnack(context, snack);
  }

  Snack _createSnack() {
    switch (_selectedSnackType) {
      case 'Success':
        return Snack.success(_title, _showMessage ? _message : null);
      case 'Warning':
        return Snack.warning(_title, _showMessage ? _message : null);
      case 'Error':
        return Snack.error(_title, _showMessage ? _message : null);
      case 'Info':
        return Snack.info(_title, _showMessage ? _message : null);
      default:
        return Snack.neutral(_title, _showMessage ? _message : null);
    }
  }

  Snack _createSnackByType(String type) {
    switch (type) {
      case 'Success':
        return Snack.success('Success!', 'Operation completed successfully.');
      case 'Warning':
        return Snack.warning('Warning!', 'Please check your input.');
      case 'Error':
        return Snack.error('Error!', 'Something went wrong.');
      case 'Info':
        return Snack.info('Info', 'Here is some information for you.');
      default:
        return Snack.neutral('Neutral', 'This is a neutral message.');
    }
  }
}
