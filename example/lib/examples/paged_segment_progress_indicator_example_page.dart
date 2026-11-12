// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart' as uikit;

class PagedSegmentProgressIndicatorExamplePage extends StatefulWidget {
  const PagedSegmentProgressIndicatorExamplePage({super.key});

  @override
  State<PagedSegmentProgressIndicatorExamplePage> createState() =>
      _PagedSegmentProgressIndicatorExamplePageState();
}

class _PagedSegmentProgressIndicatorExamplePageState
    extends State<PagedSegmentProgressIndicatorExamplePage> {
  int _currentPageIndex = 0;
  bool _autoplay = true;
  Duration _autoplayDuration = const Duration(seconds: 3);

  final List<Widget> _pages = [
    _OnboardingPage(
      title: 'Ваши вклады меняют жизни!',
      description: 'Инвестируйте в будущее и помогайте развитию экономики',
      icon: Icons.account_balance,
      color: Colors.blue,
    ),
    _OnboardingPage(
      title: 'Как это устроено?',
      description: 'Простой и понятный процесс инвестирования',
      icon: Icons.lightbulb,
      color: Colors.green,
    ),
    _OnboardingPage(
      title: 'Гибко, выгодно, этично',
      description: 'Доходность до 27% с полной прозрачностью',
      icon: Icons.trending_up,
      color: Colors.orange,
    ),
    _OnboardingPage(
      title: 'Мы меняем правила финансов!',
      description: 'Присоединяйтесь к революции в мире инвестиций',
      icon: Icons.rocket_launch,
      color: Colors.purple,
    ),
    _OnboardingPage(
      title: 'Готовы начать?',
      description: 'Создайте аккаунт и начните инвестировать уже сегодня',
      icon: Icons.check_circle,
      color: Colors.teal,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paged Segment Progress Indicator'),
        backgroundColor: context.surfaceColors.primary,
        foregroundColor: context.textColors.primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: uikit.PagedSegmentProgressIndicator(
              pages: _pages,
              currentPageIndex: _currentPageIndex,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              autoplay: _autoplay,
              autoplayDuration: _autoplayDuration,
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

          // Controls
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSwitchControl(
                  label: 'Autoplay',
                  value: _autoplay,
                  onChanged: (value) => setState(() => _autoplay = value),
                ),
                if (_autoplay)
                  _buildSliderControl(
                    label: 'Autoplay Duration (seconds)',
                    value: _autoplayDuration.inSeconds.toDouble(),
                    min: 1.0,
                    max: 10.0,
                    onChanged: (value) => setState(() =>
                        _autoplayDuration = Duration(seconds: value.round())),
                  ),

                // Navigation info
                const SizedBox(height: 16),
                Text(
                  'Page ${_currentPageIndex + 1} of ${_pages.length}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap left/right sides to navigate • Hold to pause timer',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
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
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: (max - min).round(),
            onChanged: onChanged,
          ),
          Text('${value.round()} seconds'),
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
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              icon,
              size: 60,
              color: color,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: context.textColors.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.textColors.secondary,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
