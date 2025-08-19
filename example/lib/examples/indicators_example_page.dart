import 'package:flutter/material.dart';
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

  // Segment Progress Indicator properties
  int _segmentCount = 5;
  SegmentProgressIndicatorType _segmentType = SegmentProgressIndicatorType.info;
  bool _segmentAutoplay = false;
  Duration _segmentAutoplayDuration = const Duration(seconds: 3);
  bool _segmentShowLabels = false;
  int _currentStepIndex = 2;
  final List<String> _segmentLabels = [
    'Step 1',
    'Step 2',
    'Step 3',
    'Step 4',
    'Step 5'
  ];

  // Paged Segment Progress Indicator properties
  int _pagedCurrentPageIndex = 0;
  bool _pagedAutoplay = false;
  Duration _pagedAutoplayDuration = const Duration(seconds: 3);
  bool _pagedShowSegmentProgress = true;

  // Linear Progress Indicator properties
  double _linearProgress = 0.65;
  LinearProgressIndicatorType _linearType = LinearProgressIndicatorType.neutral;
  String _linearCaption = 'Upload Progress';
  String _linearSubtitle = 'File upload in progress...';
  String _linearAdditionalCaption = '65%';
  String _linearAdditionalSubtitle = '2.3 MB';

  // Rounded Progress Indicator properties
  double _roundedProgress = 0.75;
  double _roundedSize = 96.0;
  double _roundedLineWidth = 8.0;
  bool _roundedShowPercentage = true;

  final List<Widget> _pagedPages = [
    _OnboardingPage(
      title: 'Welcome!',
      description: 'This is the first page of our demo',
      icon: Icons.home,
      color: Colors.blue,
    ),
    _OnboardingPage(
      title: 'Features',
      description: 'Discover amazing features',
      icon: Icons.star,
      color: Colors.green,
    ),
    _OnboardingPage(
      title: 'Get Started',
      description: 'Ready to begin your journey',
      icon: Icons.rocket_launch,
      color: Colors.orange,
    ),
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
            // Loading Indicator Section
            _buildIndicatorSection(
              title: 'Loading Indicator',
              child: _buildLoadingIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Page Indicator Section
            _buildIndicatorSection(
              title: 'Page Indicator',
              child: _buildPageIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Numerical Page Indicator Section
            _buildIndicatorSection(
              title: 'Numerical Page Indicator',
              child: _buildNumericalPageIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Step Indicator Section
            _buildIndicatorSection(
              title: 'Step Indicator',
              child: _buildStepIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Badge Indicator Section
            _buildIndicatorSection(
              title: 'Badge Indicator',
              child: _buildBadgeIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Segment Progress Indicator Section
            _buildIndicatorSection(
              title: 'Segment Progress Indicator',
              child: _buildSegmentProgressIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Paged Segment Progress Indicator Section
            _buildIndicatorSection(
              title: 'Paged Segment Progress Indicator',
              child: _buildPagedSegmentProgressIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Linear Progress Indicator Section
            _buildIndicatorSection(
              title: 'Linear Progress Indicator',
              child: _buildLinearProgressIndicatorSection(),
            ),
            const SizedBox(height: 24),

            // Rounded Progress Indicator Section
            _buildIndicatorSection(
              title: 'Rounded Progress Indicator',
              child: _buildRoundedProgressIndicatorSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorSection({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingIndicatorSection() {
    return Column(
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
              onChanged: (value) => setState(() => _isLoading = value),
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
        _buildSliderControl(
          label: 'Loading Size',
          value: _loadingSize,
          min: 16.0,
          max: 48.0,
          onChanged: (value) => setState(() => _loadingSize = value),
        ),
      ],
    );
  }

  Widget _buildPageIndicatorSection() {
    return Column(
      children: [
        Center(
          child: PageIndicator(
            currentPage: _currentPage + 1,
            totalPages: _totalPages,
          ),
        ),
        const SizedBox(height: 16),
        _buildSliderControl(
          label: 'Current Page',
          value: _currentPage.toDouble(),
          min: 0.0,
          max: (_totalPages - 1).toDouble(),
          onChanged: (value) => setState(() => _currentPage = value.round()),
        ),
        _buildSliderControl(
          label: 'Total Pages',
          value: _totalPages.toDouble(),
          min: 1.0,
          max: 10.0,
          onChanged: (value) => setState(() => _totalPages = value.round()),
        ),
        _buildSliderControl(
          label: 'Indicator Size',
          value: _pageIndicatorSize,
          min: 4.0,
          max: 16.0,
          onChanged: (value) => setState(() => _pageIndicatorSize = value),
        ),
      ],
    );
  }

  Widget _buildNumericalPageIndicatorSection() {
    return Column(
      children: [
        Center(
          child: NumericalPageIndicator(
            currentPage: _currentNumericalPage,
            totalPages: _totalNumericalPages,
            onPageChanged: (page) =>
                setState(() => _currentNumericalPage = page),
          ),
        ),
        const SizedBox(height: 16),
        _buildSliderControl(
          label: 'Current Page',
          value: _currentNumericalPage.toDouble(),
          min: 1.0,
          max: _totalNumericalPages.toDouble(),
          onChanged: (value) =>
              setState(() => _currentNumericalPage = value.round()),
        ),
        _buildSliderControl(
          label: 'Total Pages',
          value: _totalNumericalPages.toDouble(),
          min: 1.0,
          max: 20.0,
          onChanged: (value) =>
              setState(() => _totalNumericalPages = value.round()),
        ),
      ],
    );
  }

  Widget _buildStepIndicatorSection() {
    return Column(
      children: [
        HorizontalStepIndicator(
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
          onChanged: (index) => setState(() => _currentStep = index + 1),
        ),
        const SizedBox(height: 16),
        _buildSliderControl(
          label: 'Current Step',
          value: _currentStep.toDouble(),
          min: 1.0,
          max: _totalSteps.toDouble(),
          onChanged: (value) => setState(() => _currentStep = value.round()),
        ),
        _buildSliderControl(
          label: 'Total Steps',
          value: _totalSteps.toDouble(),
          min: 2.0,
          max: 8.0,
          onChanged: (value) => setState(() => _totalSteps = value.round()),
        ),
        _buildSwitchControl(
          label: 'Show Labels',
          value: _showStepLabels,
          onChanged: (value) => setState(() => _showStepLabels = value),
        ),
      ],
    );
  }

  Widget _buildBadgeIndicatorSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BadgeIndicator(
              count: _badgeCount,
            ),
            BadgeIndicator(
              count: 0,
            ),
            BadgeIndicator(
              count: 99,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildSliderControl(
          label: 'Badge Count',
          value: _badgeCount.toDouble(),
          min: 0.0,
          max: 99.0,
          onChanged: (value) => setState(() => _badgeCount = value.round()),
        ),
        _buildSwitchControl(
          label: 'Show Badge',
          value: _showBadge,
          onChanged: (value) => setState(() => _showBadge = value),
        ),
      ],
    );
  }

  Widget _buildSegmentProgressIndicatorSection() {
    return Column(
      children: [
        SegmentProgressIndicator(
          type: _segmentType,
          segments: _segmentCount,
          currentStepIndex: _currentStepIndex,
          autoplay: _segmentAutoplay,
          autoplayDuration: _segmentAutoplayDuration,
          showLabels: _segmentShowLabels,
          labels: _segmentShowLabels ? _segmentLabels : null,
          caption: 'Progress Steps',
          subtitle: 'Current step: ${_currentStepIndex + 1} of $_segmentCount',
        ),
        const SizedBox(height: 16),
        _buildSliderControl(
          label: 'Segment Count',
          value: _segmentCount.toDouble(),
          min: 1.0,
          max: 10.0,
          onChanged: (value) => setState(() => _segmentCount = value.round()),
        ),
        _buildSliderControl(
          label: 'Current Step',
          value: _currentStepIndex.toDouble(),
          min: 0.0,
          max: (_segmentCount - 1).toDouble(),
          onChanged: (value) =>
              setState(() => _currentStepIndex = value.round()),
        ),
        _buildDropdownControl(
          label: 'Type',
          value: _segmentType,
          items: SegmentProgressIndicatorType.values,
          onChanged: (value) => setState(() => _segmentType = value!),
        ),
        _buildSwitchControl(
          label: 'Autoplay',
          value: _segmentAutoplay,
          onChanged: (value) => setState(() => _segmentAutoplay = value),
        ),
        if (_segmentAutoplay)
          _buildSliderControl(
            label: 'Autoplay Duration (seconds)',
            value: _segmentAutoplayDuration.inSeconds.toDouble(),
            min: 1.0,
            max: 10.0,
            onChanged: (value) => setState(() =>
                _segmentAutoplayDuration = Duration(seconds: value.round())),
          ),
        _buildSwitchControl(
          label: 'Show Labels',
          value: _segmentShowLabels,
          onChanged: (value) => setState(() => _segmentShowLabels = value),
        ),
      ],
    );
  }

  Widget _buildPagedSegmentProgressIndicatorSection() {
    return Column(
      children: [
        // Paged Segment Progress Indicator
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: PagedSegmentProgressIndicator(
            pages: _pagedPages,
            currentPageIndex: _pagedCurrentPageIndex,
            onPageChanged: (index) {
              setState(() {
                _pagedCurrentPageIndex = index;
              });
            },
            showProgressIndicator: _pagedShowSegmentProgress,
            autoplay: _pagedAutoplay,
            autoplayDuration: _pagedAutoplayDuration,
            onComplete: () {
              // Handle completion
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('All pages completed!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),

        // Controls
        _buildSwitchControl(
          label: 'Autoplay',
          value: _pagedAutoplay,
          onChanged: (value) => setState(() => _pagedAutoplay = value),
        ),
        if (_pagedAutoplay)
          _buildSliderControl(
            label: 'Autoplay Duration (seconds)',
            value: _pagedAutoplayDuration.inSeconds.toDouble(),
            min: 1.0,
            max: 10.0,
            onChanged: (value) => setState(() =>
                _pagedAutoplayDuration = Duration(seconds: value.round())),
          ),
        _buildSwitchControl(
          label: 'Show Progress Indicator',
          value: _pagedShowSegmentProgress,
          onChanged: (value) =>
              setState(() => _pagedShowSegmentProgress = value),
        ),
        // Navigation buttons
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _pagedCurrentPageIndex > 0
                  ? () => setState(() => _pagedCurrentPageIndex--)
                  : null,
              child: const Text('Previous'),
            ),
            Text('Page ${_pagedCurrentPageIndex + 1} of ${_pagedPages.length}'),
            ElevatedButton(
              onPressed: _pagedCurrentPageIndex < _pagedPages.length - 1
                  ? () => setState(() => _pagedCurrentPageIndex++)
                  : null,
              child: const Text('Next'),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Tip: Tap left/right sides to navigate • Hold to pause timer',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLinearProgressIndicatorSection() {
    return Column(
      children: [
        _buildSubsectionTitle('Basic Linear Progress Indicator'),
        LinearProgressBarIndicator(
          percent: _linearProgress,
          caption: _linearCaption,
          subtitle: _linearSubtitle,
          additionalCaption: _linearAdditionalCaption,
          additionalSubtitle: _linearAdditionalSubtitle,
          type: _linearType,
        ),
        const SizedBox(height: 24),
        _buildSubsectionTitle('Different Types'),
        LinearProgressBarIndicator(
          percent: 0.3,
          caption: 'Warning Progress',
          subtitle: 'Something needs attention',
          additionalCaption: '30%',
          type: LinearProgressIndicatorType.warning,
        ),
        const SizedBox(height: 16),
        LinearProgressBarIndicator(
          percent: 0.8,
          caption: 'Error Progress',
          subtitle: 'Upload failed',
          additionalCaption: '80%',
          type: LinearProgressIndicatorType.error,
        ),
        const SizedBox(height: 16),
        LinearProgressBarIndicator(
          percent: 1.0,
          caption: 'Success Progress',
          subtitle: 'Upload completed',
          additionalCaption: '100%',
          type: LinearProgressIndicatorType.neutral,
        ),
        const SizedBox(height: 24),
        _buildSliderControl(
          label: 'Progress Percentage',
          value: _linearProgress,
          min: 0.0,
          max: 1.0,
          onChanged: (value) => setState(() => _linearProgress = value),
        ),
        _buildDropdownControl(
          label: 'Type',
          value: _linearType,
          items: LinearProgressIndicatorType.values,
          onChanged: (value) => setState(() => _linearType = value!),
        ),
        _buildTextControl(
          label: 'Caption',
          value: _linearCaption,
          onChanged: (value) => setState(() => _linearCaption = value),
        ),
        _buildTextControl(
          label: 'Subtitle',
          value: _linearSubtitle,
          onChanged: (value) => setState(() => _linearSubtitle = value),
        ),
        _buildTextControl(
          label: 'Additional Caption',
          value: _linearAdditionalCaption,
          onChanged: (value) =>
              setState(() => _linearAdditionalCaption = value),
        ),
        _buildTextControl(
          label: 'Additional Subtitle',
          value: _linearAdditionalSubtitle,
          onChanged: (value) =>
              setState(() => _linearAdditionalSubtitle = value),
        ),
      ],
    );
  }

  Widget _buildRoundedProgressIndicatorSection() {
    return Column(
      children: [
        _buildSubsectionTitle('Basic Rounded Progress Indicator'),
        Center(
          child: RoundedProgressIndicator(
            percent: _roundedProgress,
            size: _roundedSize,
            lineWidth: _roundedLineWidth,
            showPercentage: _roundedShowPercentage,
          ),
        ),
        const SizedBox(height: 24),
        _buildSubsectionTitle('Different Sizes'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedProgressIndicator(
              percent: 0.25,
              size: 60.0,
              lineWidth: 6.0,
              showPercentage: false,
            ),
            RoundedProgressIndicator(
              percent: 0.5,
              size: 80.0,
              lineWidth: 8.0,
              showPercentage: true,
            ),
            RoundedProgressIndicator(
              percent: 0.75,
              size: 120.0,
              lineWidth: 12.0,
              showPercentage: true,
            ),
          ],
        ),
        const SizedBox(height: 24),
        _buildSliderControl(
          label: 'Progress Percentage',
          value: _roundedProgress,
          min: 0.0,
          max: 1.0,
          onChanged: (value) => setState(() => _roundedProgress = value),
        ),
        _buildSliderControl(
          label: 'Size',
          value: _roundedSize,
          min: 40.0,
          max: 200.0,
          onChanged: (value) => setState(() => _roundedSize = value),
        ),
        _buildSliderControl(
          label: 'Line Width',
          value: _roundedLineWidth,
          min: 2.0,
          max: 20.0,
          onChanged: (value) => setState(() => _roundedLineWidth = value),
        ),
        _buildSwitchControl(
          label: 'Show Percentage',
          value: _roundedShowPercentage,
          onChanged: (value) => setState(() => _roundedShowPercentage = value),
        ),
      ],
    );
  }

  Widget _buildSubsectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
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

  Widget _buildDropdownControl<T>({
    required String label,
    required T value,
    required List<T> items,
    required ValueChanged<T?> onChanged,
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
            value: value,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text(item.toString().split('.').last),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              icon,
              size: 40,
              color: color,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
