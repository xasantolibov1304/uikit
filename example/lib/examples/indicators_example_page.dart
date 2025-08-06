// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class IndicatorsExamplePage extends StatefulWidget {
  const IndicatorsExamplePage({super.key});

  @override
  State<IndicatorsExamplePage> createState() => _IndicatorsExamplePageState();
}

class _IndicatorsExamplePageState extends State<IndicatorsExamplePage> {
  // Loading Indicator properties
  bool _isLoading = true;
  double _loadingSize = 24.0;

  // Page Indicator properties
  int _currentPage = 0;
  int _totalPages = 5;
  double _pageIndicatorSize = 8.0;

  // Numerical Page Indicator properties
  int _currentNumericalPage = 1;
  int _totalNumericalPages = 10;

  // Step Indicator properties
  int _currentStep = 1;
  int _totalSteps = 4;
  bool _showStepLabels = true;

  // Badge Indicator properties
  int _badgeCount = 5;
  bool _showBadge = true;
  String _badgeText = '5';

  // Segment Progress Indicator properties
  int _segmentCount = 5;
  double _segmentPercentage = 0.6;
  SegmentProgressIndicatorType _segmentType =
      SegmentProgressIndicatorType.neutral;
  bool _segmentAnimate = true;
  bool _segmentShowLabels = false;
  int _currentStepIndex = 2;
  List<String> _segmentLabels = [
    'Step 1',
    'Step 2',
    'Step 3',
    'Step 4',
    'Step 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indicators Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Loading Indicator Preview Section
            _buildSectionTitle('Loading Indicator Preview'),
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
                      Text(
                        'Loading: $_isLoading',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Switch(
                        value: _isLoading,
                        onChanged: (value) =>
                            setState(() => _isLoading = value),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: _isLoading
                        ? LoadingIndicator(size: _loadingSize)
                        : const Text('Loading stopped'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Size: ${_loadingSize.toStringAsFixed(1)}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Page Indicator Preview Section
            _buildSectionTitle('Page Indicator Preview'),
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
                    'Page ${_currentPage + 1} of $_totalPages',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  PageIndicator(
                    currentPage: _currentPage + 1,
                    totalPages: _totalPages,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _currentPage > 0
                            ? () => setState(() => _currentPage--)
                            : null,
                        child: const Text('Previous'),
                      ),
                      ElevatedButton(
                        onPressed: _currentPage < _totalPages - 1
                            ? () => setState(() => _currentPage++)
                            : null,
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Numerical Page Indicator Preview Section
            _buildSectionTitle('Numerical Page Indicator Preview'),
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
                    'Page $_currentNumericalPage of $_totalNumericalPages',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  NumericalPageIndicator(
                    currentPage: _currentNumericalPage,
                    totalPages: _totalNumericalPages,
                    onPageChanged: (page) =>
                        setState(() => _currentNumericalPage = page),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _currentNumericalPage > 1
                            ? () => setState(() => _currentNumericalPage--)
                            : null,
                        child: const Text('Previous'),
                      ),
                      ElevatedButton(
                        onPressed: _currentNumericalPage < _totalNumericalPages
                            ? () => setState(() => _currentNumericalPage++)
                            : null,
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Step Indicator Preview Section
            _buildSectionTitle('Step Indicator Preview'),
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
                    'Step $_currentStep of $_totalSteps',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  StepIndicator(
                    steps: List.generate(_totalSteps, (index) {
                      final stepNumber = index + 1;
                      StepStateType state;
                      if (stepNumber < _currentStep) {
                        state = StepStateType.completed;
                      } else if (stepNumber == _currentStep) {
                        state = StepStateType.active;
                      } else {
                        state = StepStateType.inactive;
                      }
                      return StepData(
                        label: 'Step $stepNumber',
                        state: state,
                      );
                    }),
                    currentIndex: _currentStep - 1,
                    onChanged: (index) =>
                        setState(() => _currentStep = index + 1),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _currentStep > 1
                            ? () => setState(() => _currentStep--)
                            : null,
                        child: const Text('Previous'),
                      ),
                      ElevatedButton(
                        onPressed: _currentStep < _totalSteps
                            ? () => setState(() => _currentStep++)
                            : null,
                        child: const Text('Next'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Badge Indicator Preview Section
            _buildSectionTitle('Badge Indicator Preview'),
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
                      Text(
                        'Show Badge: $_showBadge',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Switch(
                        value: _showBadge,
                        onChanged: (value) =>
                            setState(() => _showBadge = value),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        if (_showBadge)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: BadgeIndicator(
                              count: _badgeCount,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Count: $_badgeCount',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Segment Progress Indicator Preview Section
            _buildSectionTitle('Segment Progress Indicator Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildSubsectionTitle('Basic Segment Progress Indicator'),
                  SegmentProgressIndicator(
                    type: _segmentType,
                    segments: _segmentCount,
                    currentStepIndex: _currentStepIndex,
                    animate: _segmentAnimate,
                    showLabels: _segmentShowLabels,
                    labels: _segmentShowLabels ? _segmentLabels : null,
                    caption: 'Progress Steps',
                    subtitle:
                        'Current step: ${_currentStepIndex + 1} of $_segmentCount',
                  ),
                  const SizedBox(height: 24),
                  const SizedBox(height: 16),
                  _buildSliderControl(
                    label: 'Segment Count',
                    value: _segmentCount.toDouble(),
                    min: 1,
                    max: 10,
                    onChanged: (value) =>
                        setState(() => _segmentCount = value.round()),
                  ),
                  _buildSliderControl(
                    label: 'Current Step Index',
                    value: _currentStepIndex.toDouble(),
                    min: 0,
                    max: (_segmentCount - 1).toDouble(),
                    onChanged: (value) =>
                        setState(() => _currentStepIndex = value.round()),
                  ),
                  _buildSliderControl(
                    label: 'Percentage',
                    value: _segmentPercentage,
                    min: 0.0,
                    max: 1.0,
                    onChanged: (value) =>
                        setState(() => _segmentPercentage = value),
                  ),
                  _buildSwitchControl(
                    label: 'Animate',
                    value: _segmentAnimate,
                    onChanged: (value) =>
                        setState(() => _segmentAnimate = value),
                  ),
                  _buildSwitchControl(
                    label: 'Show Labels',
                    value: _segmentShowLabels,
                    onChanged: (value) =>
                        setState(() => _segmentShowLabels = value),
                  ),
                  _buildDropdownControl(
                    label: 'Type',
                    value: _segmentType,
                    items: SegmentProgressIndicatorType.values,
                    onChanged: (value) => setState(() => _segmentType = value!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Indicators Controls Section
            _buildSectionTitle('Indicators Controls'),
            _buildIndicatorsControls(),
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

  Widget _buildIndicatorsControls() {
    return Column(
      children: [
        // Loading Indicator Controls
        _buildSubsectionTitle('Loading Indicator Controls'),

        _buildSliderControl(
          label: 'Loading Size',
          value: _loadingSize,
          min: 16.0,
          max: 48.0,
          onChanged: (value) => setState(() => _loadingSize = value),
        ),

        const SizedBox(height: 24),

        // Page Indicator Controls
        _buildSubsectionTitle('Page Indicator Controls'),

        _buildSliderControl(
          label: 'Current Page',
          value: _currentPage.toDouble(),
          min: 0.0,
          max: (_totalPages - 1).toDouble(),
          onChanged: (value) => setState(() => _currentPage = value.toInt()),
        ),

        _buildSliderControl(
          label: 'Total Pages',
          value: _totalPages.toDouble(),
          min: 2.0,
          max: 10.0,
          onChanged: (value) => setState(() => _totalPages = value.toInt()),
        ),

        _buildSliderControl(
          label: 'Indicator Size',
          value: _pageIndicatorSize,
          min: 4.0,
          max: 16.0,
          onChanged: (value) => setState(() => _pageIndicatorSize = value),
        ),

        const SizedBox(height: 24),

        // Numerical Page Indicator Controls
        _buildSubsectionTitle('Numerical Page Indicator Controls'),

        _buildSliderControl(
          label: 'Current Page',
          value: _currentNumericalPage.toDouble(),
          min: 1.0,
          max: _totalNumericalPages.toDouble(),
          onChanged: (value) =>
              setState(() => _currentNumericalPage = value.toInt()),
        ),

        _buildSliderControl(
          label: 'Total Pages',
          value: _totalNumericalPages.toDouble(),
          min: 5.0,
          max: 20.0,
          onChanged: (value) =>
              setState(() => _totalNumericalPages = value.toInt()),
        ),

        const SizedBox(height: 24),

        // Step Indicator Controls
        _buildSubsectionTitle('Step Indicator Controls'),

        _buildSliderControl(
          label: 'Current Step',
          value: _currentStep.toDouble(),
          min: 1.0,
          max: _totalSteps.toDouble(),
          onChanged: (value) => setState(() => _currentStep = value.toInt()),
        ),

        _buildSliderControl(
          label: 'Total Steps',
          value: _totalSteps.toDouble(),
          min: 2.0,
          max: 8.0,
          onChanged: (value) => setState(() => _totalSteps = value.toInt()),
        ),

        _buildSwitchControl(
          label: 'Show Step Labels',
          value: _showStepLabels,
          onChanged: (value) => setState(() => _showStepLabels = value),
        ),

        const SizedBox(height: 24),

        // Badge Indicator Controls
        _buildSubsectionTitle('Badge Indicator Controls'),

        _buildSliderControl(
          label: 'Badge Count',
          value: _badgeCount.toDouble(),
          min: 0.0,
          max: 99.0,
          onChanged: (value) => setState(() => _badgeCount = value.toInt()),
        ),

        _buildTextControl(
          label: 'Badge Text',
          value: _badgeText,
          onChanged: (value) => setState(() => _badgeText = value),
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
                value.toStringAsFixed(1),
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

  Widget _buildDropdownControl({
    required String label,
    required SegmentProgressIndicatorType value,
    required List<SegmentProgressIndicatorType> items,
    required ValueChanged<SegmentProgressIndicatorType?> onChanged,
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
          DropdownButtonFormField<SegmentProgressIndicatorType>(
            value: value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: items.map((item) {
              return DropdownMenuItem<SegmentProgressIndicatorType>(
                value: item,
                child: Text(item.name),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
