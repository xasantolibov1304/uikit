// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class NoticeExamplePage extends StatefulWidget {
  const NoticeExamplePage({super.key});

  @override
  State<NoticeExamplePage> createState() => _NoticeExamplePageState();
}

class _NoticeExamplePageState extends State<NoticeExamplePage> {
  // Notice properties
  NoticeType _backgroundType = NoticeType.neutral;
  NoticeType _iconType = NoticeType.neutral;
  ButtonType _buttonType = ButtonType.primary;
  String _title = 'Notice Title';
  String _description =
      'This is a notice description with some additional text to demonstrate the component.';
  String _buttonText = 'Action Button';
  bool _showTitle = true;
  bool _showDescription = true;
  bool _showButton = false;
  bool _showDismiss = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notice Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notice Preview Section
            _buildSectionTitle('Notice Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Notice(
                title: _showTitle ? _title : null,
                description: _showDescription ? _description : null,
                buttonText: _showButton ? _buttonText : null,
                backgroundType: _backgroundType,
                iconType: _iconType,
                buttonType: _buttonType,
                onButtonTap:
                    _showButton ? () => _showSnackBar('Button tapped!') : null,
                onDismiss: _showDismiss
                    ? () => _showSnackBar('Notice dismissed!')
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // Notice Controls Section
            _buildSectionTitle('Notice Controls'),
            _buildNoticeControls(),
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

  Widget _buildNoticeControls() {
    return Column(
      children: [
        // Background Type
        _buildDropdownControl<NoticeType>(
          label: 'Background Type',
          value: _backgroundType,
          items: NoticeType.values,
          onChanged: (value) => setState(() => _backgroundType = value!),
          itemBuilder: (type) => type.name.toUpperCase(),
        ),

        // Icon Type
        _buildDropdownControl<NoticeType>(
          label: 'Icon Type',
          value: _iconType,
          items: NoticeType.values,
          onChanged: (value) => setState(() => _iconType = value!),
          itemBuilder: (type) => type.name.toUpperCase(),
        ),

        // Button Type
        _buildDropdownControl<ButtonType>(
          label: 'Button Type',
          value: _buttonType,
          items: ButtonType.values,
          onChanged: (value) => setState(() => _buttonType = value!),
          itemBuilder: (type) => type.name.toUpperCase(),
        ),

        // Title
        _buildTextControl(
          label: 'Title',
          value: _title,
          onChanged: (value) => setState(() => _title = value),
        ),

        // Description
        _buildTextControl(
          label: 'Description',
          value: _description,
          onChanged: (value) => setState(() => _description = value),
        ),

        // Button Text
        _buildTextControl(
          label: 'Button Text',
          value: _buttonText,
          onChanged: (value) => setState(() => _buttonText = value),
        ),

        // Boolean controls
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
          label: 'Show Button',
          value: _showButton,
          onChanged: (value) => setState(() => _showButton = value),
        ),

        _buildSwitchControl(
          label: 'Show Dismiss',
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
