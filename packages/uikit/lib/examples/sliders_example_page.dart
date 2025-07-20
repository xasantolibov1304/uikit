// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class SlidersExamplePage extends StatefulWidget {
  const SlidersExamplePage({super.key});

  @override
  State<SlidersExamplePage> createState() => _SlidersExamplePageState();
}

class _SlidersExamplePageState extends State<SlidersExamplePage> {
  // Input Slider properties
  double _inputSliderValue = 0.5;
  double _inputSliderMin = 0.0;
  double _inputSliderMax = 1.0;
  int? _inputSliderDivisions = 10;
  bool _showInputSliderDivisions = true;

  // Double Slider properties
  RangeValues _doubleSliderValues = const RangeValues(0.2, 0.8);
  double _doubleSliderMin = 0.0;
  double _doubleSliderMax = 1.0;
  int? _doubleSliderDivisions = 10;
  bool _showDoubleSliderDivisions = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Slider Preview Section
            _buildSectionTitle('Input Slider Preview'),
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
                    'Value: ${_inputSliderValue.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  InputSlider(
                    value: _inputSliderValue,
                    min: _inputSliderMin,
                    max: _inputSliderMax,
                    divisions: _showInputSliderDivisions
                        ? _inputSliderDivisions
                        : null,
                    onChanged: (value) =>
                        setState(() => _inputSliderValue = value),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Range: ${_inputSliderMin.toStringAsFixed(1)} - ${_inputSliderMax.toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (_showInputSliderDivisions) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Divisions: $_inputSliderDivisions',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Double Slider Preview Section
            _buildSectionTitle('Double Slider Preview'),
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
                    'Start: ${_doubleSliderValues.start.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    'End: ${_doubleSliderValues.end.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  DoubleSlider(
                    min: _doubleSliderMin,
                    max: _doubleSliderMax,
                    values: _doubleSliderValues,
                    divisions: _showDoubleSliderDivisions
                        ? _doubleSliderDivisions
                        : null,
                    onChanged: (values) =>
                        setState(() => _doubleSliderValues = values),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Range: ${_doubleSliderMin.toStringAsFixed(1)} - ${_doubleSliderMax.toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (_showDoubleSliderDivisions) ...[
                    const SizedBox(height: 8),
                    Text(
                      'Divisions: $_doubleSliderDivisions',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Input Slider with Child Section
            _buildSectionTitle('Input Slider with Child'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: InputSlider(
                value: _inputSliderValue,
                min: _inputSliderMin,
                max: _inputSliderMax,
                divisions:
                    _showInputSliderDivisions ? _inputSliderDivisions : null,
                onChanged: (value) => setState(() => _inputSliderValue = value),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.blue.withValues(alpha: 0.3)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Slider with Background',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This slider has a custom background widget.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Sliders Controls Section
            _buildSectionTitle('Sliders Controls'),
            _buildSlidersControls(),
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

  Widget _buildSlidersControls() {
    return Column(
      children: [
        // Input Slider Controls
        _buildSubsectionTitle('Input Slider Controls'),

        // Input Slider Value
        _buildSliderControl(
          label: 'Value',
          value: _inputSliderValue,
          min: _inputSliderMin,
          max: _inputSliderMax,
          onChanged: (value) => setState(() => _inputSliderValue = value),
        ),

        // Input Slider Min
        _buildSliderControl(
          label: 'Min Value',
          value: _inputSliderMin,
          min: 0.0,
          max: 1.0,
          onChanged: (value) => setState(() => _inputSliderMin = value),
        ),

        // Input Slider Max
        _buildSliderControl(
          label: 'Max Value',
          value: _inputSliderMax,
          min: 0.0,
          max: 2.0,
          onChanged: (value) => setState(() => _inputSliderMax = value),
        ),

        // Input Slider Divisions
        _buildSliderControl(
          label: 'Divisions',
          value: _inputSliderDivisions?.toDouble() ?? 0.0,
          min: 0.0,
          max: 20.0,
          onChanged: (value) =>
              setState(() => _inputSliderDivisions = value.toInt()),
        ),

        // Show Input Slider Divisions
        _buildSwitchControl(
          label: 'Show Divisions',
          value: _showInputSliderDivisions,
          onChanged: (value) =>
              setState(() => _showInputSliderDivisions = value),
        ),

        const SizedBox(height: 24),

        // Double Slider Controls
        _buildSubsectionTitle('Double Slider Controls'),

        // Double Slider Start Value
        _buildSliderControl(
          label: 'Start Value',
          value: _doubleSliderValues.start,
          min: _doubleSliderMin,
          max: _doubleSliderMax,
          onChanged: (value) => setState(() => _doubleSliderValues =
              RangeValues(value, _doubleSliderValues.end)),
        ),

        // Double Slider End Value
        _buildSliderControl(
          label: 'End Value',
          value: _doubleSliderValues.end,
          min: _doubleSliderMin,
          max: _doubleSliderMax,
          onChanged: (value) => setState(() => _doubleSliderValues =
              RangeValues(_doubleSliderValues.start, value)),
        ),

        // Double Slider Min
        _buildSliderControl(
          label: 'Min Value',
          value: _doubleSliderMin,
          min: 0.0,
          max: 1.0,
          onChanged: (value) => setState(() => _doubleSliderMin = value),
        ),

        // Double Slider Max
        _buildSliderControl(
          label: 'Max Value',
          value: _doubleSliderMax,
          min: 0.0,
          max: 2.0,
          onChanged: (value) => setState(() => _doubleSliderMax = value),
        ),

        // Double Slider Divisions
        _buildSliderControl(
          label: 'Divisions',
          value: _doubleSliderDivisions?.toDouble() ?? 0.0,
          min: 0.0,
          max: 20.0,
          onChanged: (value) =>
              setState(() => _doubleSliderDivisions = value.toInt()),
        ),

        // Show Double Slider Divisions
        _buildSwitchControl(
          label: 'Show Divisions',
          value: _showDoubleSliderDivisions,
          onChanged: (value) =>
              setState(() => _showDoubleSliderDivisions = value),
        ),
      ],
    );
  }

  Widget _buildSubsectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
                value.toStringAsFixed(2),
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
}
