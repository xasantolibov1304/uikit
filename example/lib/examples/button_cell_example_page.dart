// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class ButtonCellExamplePage extends StatefulWidget {
  const ButtonCellExamplePage({super.key});

  @override
  State<ButtonCellExamplePage> createState() => _ButtonCellExamplePageState();
}

class _ButtonCellExamplePageState extends State<ButtonCellExamplePage> {
  // ButtonCell properties
  String? _primaryText = 'Primary Button';
  String? _secondaryText = 'Secondary Button';
  String? _tertiaryText = 'Cancel';
  Axis _direction = Axis.vertical;
  String? _captionText;
  String? _captionHighlight;
  String? _anchorTitle;
  String? _informativeTitle;
  bool _showAnchorIcon = false;
  bool _showInformativeIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonCell Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Interactive ButtonCell Preview
            _buildSectionTitle('Interactive ButtonCell'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: ButtonCell(
                direction: _direction,
                primaryText: _primaryText,
                onPrimaryTap: () => _showSnackBar('Primary tapped!'),
                secondaryText: _secondaryText,
                onSecondaryTap: () => _showSnackBar('Secondary tapped!'),
                tertiaryText: _tertiaryText,
                onTertiaryTap: () => _showSnackBar('Tertiary tapped!'),
                captionText: _captionText,
                captionHighlight: _captionHighlight,
                onCaptionTap: () => _showSnackBar('Caption tapped!'),
                anchorTitle: _anchorTitle,
                anchorIcon: _showAnchorIcon
                    ? Icon(Icons.chevron_right,
                        color: Theme.of(context).textColors.primary)
                    : null,
                onAnchorTap: () => _showSnackBar('Anchor tapped!'),
                informativeTitle: _informativeTitle,
                informativeIcon: _showInformativeIcon
                    ? Icon(Icons.info_outline,
                        color: Theme.of(context).textColors.primary)
                    : null,
              ),
            ),
            const SizedBox(height: 24),

            // Controls Section
            _buildSectionTitle('Controls'),
            _buildControls(),
            const SizedBox(height: 24),

            // Predefined Examples Section
            _buildSectionTitle('Predefined Examples'),
            _buildPredefinedExamples(),
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

  Widget _buildControls() {
    return Column(
      children: [
        // Direction
        _buildDropdownControl<Axis>(
          label: 'Direction',
          value: _direction,
          items: Axis.values,
          onChanged: (value) => setState(() => _direction = value!),
          itemBuilder: (axis) =>
              axis == Axis.horizontal ? 'Horizontal' : 'Vertical',
        ),

        // Primary Text
        _buildTextControl(
          label: 'Primary Text',
          value: _primaryText ?? '',
          onChanged: (value) =>
              setState(() => _primaryText = value.isEmpty ? null : value),
        ),

        // Secondary Text
        _buildTextControl(
          label: 'Secondary Text',
          value: _secondaryText ?? '',
          onChanged: (value) =>
              setState(() => _secondaryText = value.isEmpty ? null : value),
        ),

        // Tertiary Text
        _buildTextControl(
          label: 'Tertiary Text',
          value: _tertiaryText ?? '',
          onChanged: (value) =>
              setState(() => _tertiaryText = value.isEmpty ? null : value),
        ),

        // Caption Text
        _buildTextControl(
          label: 'Caption Text',
          value: _captionText ?? '',
          onChanged: (value) =>
              setState(() => _captionText = value.isEmpty ? null : value),
        ),

        // Caption Highlight
        _buildTextControl(
          label: 'Caption Highlight',
          value: _captionHighlight ?? '',
          onChanged: (value) =>
              setState(() => _captionHighlight = value.isEmpty ? null : value),
        ),

        // Anchor Title
        _buildTextControl(
          label: 'Anchor Title',
          value: _anchorTitle ?? '',
          onChanged: (value) =>
              setState(() => _anchorTitle = value.isEmpty ? null : value),
        ),

        // Informative Title
        _buildTextControl(
          label: 'Informative Title',
          value: _informativeTitle ?? '',
          onChanged: (value) =>
              setState(() => _informativeTitle = value.isEmpty ? null : value),
        ),

        // Boolean controls
        _buildSwitchControl(
          label: 'Show Anchor Icon',
          value: _showAnchorIcon,
          onChanged: (value) => setState(() => _showAnchorIcon = value),
        ),

        _buildSwitchControl(
          label: 'Show Informative Icon',
          value: _showInformativeIcon,
          onChanged: (value) => setState(() => _showInformativeIcon = value),
        ),
      ],
    );
  }

  Widget _buildPredefinedExamples() {
    return Column(
      children: [
        _buildExampleCard(
          title: 'Basic ButtonCell',
          description: 'Simple ButtonCell with primary and secondary buttons',
          buttonCell: ButtonCell(
            primaryText: 'Continue',
            onPrimaryTap: () => _showSnackBar('Continue tapped!'),
            secondaryText: 'Back',
            onSecondaryTap: () => _showSnackBar('Back tapped!'),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleCard(
          title: 'Horizontal Layout',
          description: 'ButtonCell with horizontal direction',
          buttonCell: ButtonCell(
            direction: Axis.horizontal,
            primaryText: 'Save',
            onPrimaryTap: () => _showSnackBar('Save tapped!'),
            secondaryText: 'Cancel',
            onSecondaryTap: () => _showSnackBar('Cancel tapped!'),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleCard(
          title: 'With Caption',
          description: 'ButtonCell with caption text and highlight',
          buttonCell: ButtonCell(
            primaryText: 'Accept',
            onPrimaryTap: () => _showSnackBar('Accept tapped!'),
            secondaryText: 'Decline',
            onSecondaryTap: () => _showSnackBar('Decline tapped!'),
            captionText:
                'By clicking Accept, you agree to our Terms of Service and Privacy Policy',
            captionHighlight: 'Terms of Service',
            onCaptionTap: () => _showSnackBar('Terms of Service tapped!'),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleCard(
          title: 'With Anchor',
          description: 'ButtonCell with anchor title and icon',
          buttonCell: ButtonCell(
            primaryText: 'Proceed',
            onPrimaryTap: () => _showSnackBar('Proceed tapped!'),
            secondaryText: 'Skip',
            onSecondaryTap: () => _showSnackBar('Skip tapped!'),
            anchorTitle: 'Learn more about this feature',
            anchorIcon: Icon(Icons.chevron_right,
                color: Theme.of(context).textColors.primary),
            onAnchorTap: () => _showSnackBar('Learn more tapped!'),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleCard(
          title: 'With Informative',
          description: 'ButtonCell with informative text and icon',
          buttonCell: ButtonCell(
            primaryText: 'Delete',
            onPrimaryTap: () => _showSnackBar('Delete tapped!'),
            secondaryText: 'Keep',
            onSecondaryTap: () => _showSnackBar('Keep tapped!'),
            informativeTitle: 'This action cannot be undone',
            informativeIcon: Icon(Icons.warning,
                color: Theme.of(context).textColors.primary),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleCard(
          title: 'Complete Example',
          description: 'ButtonCell with all features enabled',
          buttonCell: ButtonCell(
            direction: Axis.horizontal,
            primaryText: 'Confirm Payment',
            onPrimaryTap: () => _showSnackBar('Payment confirmed!'),
            secondaryText: 'Review',
            onSecondaryTap: () => _showSnackBar('Review tapped!'),
            tertiaryText: 'Cancel',
            onTertiaryTap: () => _showSnackBar('Cancel tapped!'),
            captionText: 'You will be charged \$9.99 for this subscription',
            captionHighlight: '\$9.99',
            onCaptionTap: () => _showSnackBar('Price info tapped!'),
            anchorTitle: 'View payment details',
            anchorIcon: Icon(Icons.chevron_right,
                color: Theme.of(context).textColors.primary),
            onAnchorTap: () => _showSnackBar('Payment details tapped!'),
            informativeTitle: 'Secure payment powered by Stripe',
            informativeIcon: Icon(Icons.security,
                color: Theme.of(context).textColors.primary),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleCard(
          title: 'Minimal Example',
          description: 'ButtonCell with only primary button',
          buttonCell: ButtonCell(
            primaryText: 'OK',
            onPrimaryTap: () => _showSnackBar('OK tapped!'),
          ),
        ),
        const SizedBox(height: 16),
        _buildExampleCard(
          title: 'Two Buttons Only',
          description: 'ButtonCell with primary and tertiary buttons',
          buttonCell: ButtonCell(
            primaryText: 'Submit',
            onPrimaryTap: () => _showSnackBar('Submit tapped!'),
            tertiaryText: 'Cancel',
            onTertiaryTap: () => _showSnackBar('Cancel tapped!'),
          ),
        ),
      ],
    );
  }

  Widget _buildExampleCard({
    required String title,
    required String description,
    required Widget buttonCell,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 12),
          buttonCell,
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
