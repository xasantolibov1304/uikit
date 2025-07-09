// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class SwitcherExamplePage extends StatefulWidget {
  const SwitcherExamplePage({super.key});

  @override
  State<SwitcherExamplePage> createState() => _SwitcherExamplePageState();
}

class _SwitcherExamplePageState extends State<SwitcherExamplePage> {
  // Switcher properties
  bool _value = false;
  bool _isEnabled = true;
  bool _readonly = false;

  // Switcher card properties
  bool _cardValue = false;
  String _cardTitle = 'Switcher Card';
  String _cardSubtitle = 'This is a subtitle for the switcher card';
  bool _showCardSubtitle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switcher Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Switcher Preview Section
            _buildSectionTitle('Switcher Preview'),
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
                  SwitcherMini(
                    value: _value,
                    onChanged: (value) => setState(() => _value = value),
                    isEnabled: _isEnabled,
                    readonly: _readonly,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    _value ? 'ON' : 'OFF',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Different Switcher States Preview
            _buildSectionTitle('Different Switcher States'),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Enabled ON'),
                      SwitcherMini(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Enabled OFF'),
                      SwitcherMini(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Disabled ON'),
                      SwitcherMini(
                        value: true,
                        onChanged: (value) {},
                        isEnabled: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Disabled OFF'),
                      SwitcherMini(
                        value: false,
                        onChanged: (value) {},
                        isEnabled: false,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Readonly ON'),
                      SwitcherMini(
                        value: true,
                        onChanged: (value) {},
                        readonly: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Readonly OFF'),
                      SwitcherMini(
                        value: false,
                        onChanged: (value) {},
                        readonly: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Switcher Card Preview Section
            _buildSectionTitle('Switcher Card Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SwitcherCard(
                title: _cardTitle,
                subtitle: _showCardSubtitle ? _cardSubtitle : null,
                value: _cardValue,
                onChanged: (value) => setState(() => _cardValue = value),
              ),
            ),
            const SizedBox(height: 24),

            // Different Switcher Cards Preview
            _buildSectionTitle('Different Switcher Cards'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SwitcherCard(
                    title: 'Simple Switcher Card',
                    value: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  SwitcherCard(
                    title: 'Switcher Card with Subtitle',
                    subtitle: 'This card has a subtitle',
                    value: false,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 12),
                  SwitcherCard(
                    title: 'Another Switcher Card',
                    subtitle: 'This is another example with a longer subtitle',
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Switcher Card Positions Preview
            _buildSectionTitle('Switcher Card Positions'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  SwitcherCard(
                    title: 'Switcher at End (Default)',
                    subtitle:
                        'This is the default position with switcher at the end',
                    value: true,
                    onChanged: (value) {},
                    position: SwitcherCardPosition.end,
                  ),
                  const SizedBox(height: 12),
                  SwitcherCard(
                    title: 'Switcher at Start',
                    subtitle:
                        'This card has the switcher positioned at the start',
                    value: false,
                    onChanged: (value) {},
                    position: SwitcherCardPosition.start,
                  ),
                  const SizedBox(height: 12),
                  SwitcherCard(
                    title: 'Another End Position Example',
                    subtitle: 'Another example with switcher at the end',
                    value: true,
                    onChanged: (value) {},
                    position: SwitcherCardPosition.end,
                  ),
                  const SizedBox(height: 12),
                  SwitcherCard(
                    title: 'Another Start Position Example',
                    subtitle: 'Another example with switcher at the start',
                    value: false,
                    onChanged: (value) {},
                    position: SwitcherCardPosition.start,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Switcher Controls Section
            _buildSectionTitle('Switcher Controls'),
            _buildSwitcherControls(),

            const SizedBox(height: 24),

            // Switcher Card Controls Section
            _buildSectionTitle('Switcher Card Controls'),
            _buildSwitcherCardControls(),
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

  Widget _buildSwitcherControls() {
    return Column(
      children: [
        // Boolean controls
        _buildSwitchControl(
          label: 'Enabled',
          value: _isEnabled,
          onChanged: (value) => setState(() => _isEnabled = value),
        ),

        _buildSwitchControl(
          label: 'Readonly',
          value: _readonly,
          onChanged: (value) => setState(() => _readonly = value),
        ),
      ],
    );
  }

  Widget _buildSwitcherCardControls() {
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
