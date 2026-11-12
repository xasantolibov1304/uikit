// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class TabBarExamplePage extends StatefulWidget {
  const TabBarExamplePage({super.key});

  @override
  State<TabBarExamplePage> createState() => _TabBarExamplePageState();
}

class _TabBarExamplePageState extends State<TabBarExamplePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _customTabController;

  List<String> _tabLabels = ['Tab 1', 'Tab 2', 'Tab 3'];
  EdgeInsets _tabMargin = EdgeInsets.zero;
  bool _showCustomTabs = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabLabels.length, vsync: this);
    _customTabController =
        TabController(length: _tabLabels.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _customTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Bar Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tab Bar Preview Section
            _buildSectionTitle('Tab Bar Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CommonTabBar(
                    tabLabels: _tabLabels,
                    tabController: _tabController,
                    margin: _tabMargin,
                    onTap: (index) => _showSnackBar('Tab ${index + 1} tapped!'),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      controller: _tabController,
                      children: _tabLabels.map((label) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Center(
                            child: Text(
                              'Content for $label',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Custom Tab Bar Section
            _buildSectionTitle('Custom Tab Bar'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  CommonTabBar(
                    tabLabels: ['Home', 'Profile', 'Settings'],
                    tabController: _customTabController,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    onTap: (index) =>
                        _showSnackBar('Custom tab ${index + 1} tapped!'),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: TabBarView(
                      controller: _customTabController,
                      children: [
                        _buildTabContent('Home', Icons.home, Colors.blue),
                        _buildTabContent('Profile', Icons.person, Colors.green),
                        _buildTabContent(
                            'Settings', Icons.settings, Colors.orange),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tab Bar Controls Section
            _buildSectionTitle('Tab Bar Controls'),
            _buildTabBarControls(),
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

  Widget _buildTabContent(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: color,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'This is the content for the $title tab.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTabBarControls() {
    return Column(
      children: [
        // Tab Labels
        _buildTextControl(
          label: 'Tab Labels (comma separated)',
          value: _tabLabels.join(', '),
          onChanged: (value) {
            setState(() {
              _tabLabels = value
                  .split(',')
                  .map((e) => e.trim())
                  .where((e) => e.isNotEmpty)
                  .toList();
              _updateTabControllers();
            });
          },
        ),

        // Tab Margin
        _buildDropdownControl<String>(
          label: 'Tab Margin',
          value: _getMarginString(_tabMargin),
          items: ['None', 'Small', 'Medium', 'Large'],
          onChanged: (value) {
            setState(() {
              _tabMargin = _getMarginFromString(value!);
            });
          },
          itemBuilder: (margin) => margin,
        ),

        // Show Custom Tabs
        _buildSwitchControl(
          label: 'Show Custom Tabs',
          value: _showCustomTabs,
          onChanged: (value) => setState(() => _showCustomTabs = value),
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

  void _updateTabControllers() {
    _tabController.dispose();
    _tabController = TabController(length: _tabLabels.length, vsync: this);
  }

  String _getMarginString(EdgeInsets margin) {
    if (margin == EdgeInsets.zero) return 'None';
    if (margin == const EdgeInsets.symmetric(horizontal: 8)) return 'Small';
    if (margin == const EdgeInsets.symmetric(horizontal: 16)) return 'Medium';
    if (margin == const EdgeInsets.symmetric(horizontal: 24)) return 'Large';
    return 'None';
  }

  EdgeInsets _getMarginFromString(String margin) {
    switch (margin) {
      case 'Small':
        return const EdgeInsets.symmetric(horizontal: 8);
      case 'Medium':
        return const EdgeInsets.symmetric(horizontal: 16);
      case 'Large':
        return const EdgeInsets.symmetric(horizontal: 24);
      default:
        return EdgeInsets.zero;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
