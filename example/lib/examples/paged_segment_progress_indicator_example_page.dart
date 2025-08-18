// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart' as uikit;

class PagedSegmentProgressIndicatorExamplePage extends StatefulWidget {
  const PagedSegmentProgressIndicatorExamplePage({super.key});

  @override
  State<PagedSegmentProgressIndicatorExamplePage> createState() =>
      _PagedSegmentProgressIndicatorExamplePageState();
}

class _PagedSegmentProgressIndicatorExamplePageState
    extends State<PagedSegmentProgressIndicatorExamplePage> {
  int _currentPageIndex = 0;

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

  final List<String> _labels = [
    'Вклады',
    'Устройство',
    'Выгода',
    'Правила',
    'Старт',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paged Segment Progress Indicator'),
        backgroundColor: context.surfaceColors.primary,
        foregroundColor: context.textColors.primary,
      ),
      body: uikit.PagedSegmentProgressIndicator(
        pages: _pages,
        currentPageIndex: _currentPageIndex,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        segmentProgressIndicator: uikit.SegmentProgressIndicator(
          labels: _labels,
          showLabels: true,
          segments: _pages.length,
          padding: const EdgeInsets.all(12),
          currentStepIndex: _currentPageIndex,
          autoplay: true,
          autoplayDuration: const Duration(seconds: 3),
          onSegmentChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
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
