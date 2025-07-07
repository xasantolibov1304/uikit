// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class InputsExamplePage extends StatefulWidget {
  const InputsExamplePage({super.key});

  @override
  State<InputsExamplePage> createState() => _InputsExamplePageState();
}

class _InputsExamplePageState extends State<InputsExamplePage> {
  // Input properties
  String _label = 'Input Label';
  String _hintText = 'Enter text here';
  String _captionText = 'Caption text';
  String _captionHelperText = 'Helper text';
  String _suffixValue = 'Suffix';
  InputFieldSize _size = InputFieldSize.medium;
  InputFieldStatus _status = InputFieldStatus.info;
  bool _isEnabled = true;
  bool _isRequired = false;
  bool _isLoading = false;
  bool _canClear = false;
  bool _showCaptionText = true;
  bool _showCaptionHelperText = true;
  bool _showSuffixValue = false;
  bool _showLeadingIcon = false;
  bool _showTrailingIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InputField Preview Section
            _buildSectionTitle('InputField Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: InputField(
                label: _label,
                hintText: _hintText,
                captionText: _showCaptionText ? _captionText : null,
                captionHelperText:
                    _showCaptionHelperText ? _captionHelperText : null,
                suffixValue: _showSuffixValue ? _suffixValue : null,
                size: _size,
                status: _status,
                isEnabled: _isEnabled,
                isRequired: _isRequired,
                isLoading: _isLoading,
                canClear: _canClear,
                leadingIcon: _showLeadingIcon
                    ? Icon(Icons.email, color: Colors.blue)
                    : null,
                trailingIcon: _showTrailingIcon
                    ? Icon(Icons.arrow_forward_ios, color: Colors.grey)
                    : null,
                onChanged: (value) => debugPrint('Input changed: $value'),
              ),
            ),
            const SizedBox(height: 24),

            // Different Input Types Preview
            _buildSectionTitle('Different Input Types'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  InputField(
                    label: 'Text Input',
                    hintText: 'Enter text',
                    onChanged: (value) => debugPrint('Text: $value'),
                  ),
                  const SizedBox(height: 16),
                  PhoneTextField(
                    label: 'Phone Input',
                    onChanged: (value) => debugPrint('Phone: $value'),
                    onContactsTap: () => _showSnackBar('Contacts tapped!'),
                  ),
                  const SizedBox(height: 16),
                  PasswordInputField(
                    label: 'Password Input',
                    onChanged: (value) => debugPrint('Password: $value'),
                  ),
                  const SizedBox(height: 16),
                  IdInputField(
                    label: 'ID Input',
                    onChanged: (value) => debugPrint('ID: $value'),
                  ),
                  const SizedBox(height: 16),
                  DateInputField(
                    label: 'Date Input',
                    onChanged: (value) => debugPrint('Date: $value'),
                    onSelectDateTap: () => _showSnackBar('Date picker tapped!'),
                  ),
                  const SizedBox(height: 16),
                  TimeInputField(
                    label: 'Time Input',
                    onChanged: (value) => debugPrint('Time: $value'),
                    onSelectTimeTap: () => _showSnackBar('Time picker tapped!'),
                  ),
                  const SizedBox(height: 16),
                  SelectInputField(
                    label: 'Select Input',
                    onSelectTap: () => _showSnackBar('Select tapped!'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Different Sizes Preview
            _buildSectionTitle('Different Sizes'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  InputField(
                    label: 'Small Size',
                    hintText: 'Small input',
                    size: InputFieldSize.small,
                    onChanged: (value) => debugPrint('Small: $value'),
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    label: 'Medium Size',
                    hintText: 'Medium input',
                    size: InputFieldSize.medium,
                    onChanged: (value) => debugPrint('Medium: $value'),
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    label: 'Large Size',
                    hintText: 'Large input',
                    size: InputFieldSize.large,
                    onChanged: (value) => debugPrint('Large: $value'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Inputs Controls Section
            _buildSectionTitle('Inputs Controls'),
            _buildInputsControls(),
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

  Widget _buildInputsControls() {
    return Column(
      children: [
        // Size
        _buildDropdownControl<InputFieldSize>(
          label: 'Size',
          value: _size,
          items: InputFieldSize.values,
          onChanged: (value) => setState(() => _size = value!),
          itemBuilder: (size) => size.name.toUpperCase(),
        ),

        // Status
        _buildDropdownControl<InputFieldStatus>(
          label: 'Status',
          value: _status,
          items: InputFieldStatus.values,
          onChanged: (value) => setState(() => _status = value!),
          itemBuilder: (status) => status.name.toUpperCase(),
        ),

        // Label
        _buildTextControl(
          label: 'Label',
          value: _label,
          onChanged: (value) => setState(() => _label = value),
        ),

        // Hint Text
        _buildTextControl(
          label: 'Hint Text',
          value: _hintText,
          onChanged: (value) => setState(() => _hintText = value),
        ),

        // Caption Text
        _buildTextControl(
          label: 'Caption Text',
          value: _captionText,
          onChanged: (value) => setState(() => _captionText = value),
        ),

        // Caption Helper Text
        _buildTextControl(
          label: 'Helper Text',
          value: _captionHelperText,
          onChanged: (value) => setState(() => _captionHelperText = value),
        ),

        // Suffix Value
        _buildTextControl(
          label: 'Suffix Value',
          value: _suffixValue,
          onChanged: (value) => setState(() => _suffixValue = value),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Enabled',
          value: _isEnabled,
          onChanged: (value) => setState(() => _isEnabled = value),
        ),

        _buildSwitchControl(
          label: 'Required',
          value: _isRequired,
          onChanged: (value) => setState(() => _isRequired = value),
        ),

        _buildSwitchControl(
          label: 'Loading',
          value: _isLoading,
          onChanged: (value) => setState(() => _isLoading = value),
        ),

        _buildSwitchControl(
          label: 'Can Clear',
          value: _canClear,
          onChanged: (value) => setState(() => _canClear = value),
        ),

        _buildSwitchControl(
          label: 'Show Caption Text',
          value: _showCaptionText,
          onChanged: (value) => setState(() => _showCaptionText = value),
        ),

        _buildSwitchControl(
          label: 'Show Helper Text',
          value: _showCaptionHelperText,
          onChanged: (value) => setState(() => _showCaptionHelperText = value),
        ),

        _buildSwitchControl(
          label: 'Show Suffix Value',
          value: _showSuffixValue,
          onChanged: (value) => setState(() => _showSuffixValue = value),
        ),

        _buildSwitchControl(
          label: 'Show Leading Icon',
          value: _showLeadingIcon,
          onChanged: (value) => setState(() => _showLeadingIcon = value),
        ),

        _buildSwitchControl(
          label: 'Show Trailing Icon',
          value: _showTrailingIcon,
          onChanged: (value) => setState(() => _showTrailingIcon = value),
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
