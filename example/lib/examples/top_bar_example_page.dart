// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class TopBarExamplePage extends StatefulWidget {
  const TopBarExamplePage({super.key});

  @override
  State<TopBarExamplePage> createState() => _TopBarExamplePageState();
}

class _TopBarExamplePageState extends State<TopBarExamplePage> {
  // App Bar properties
  String _title = 'Example Title';
  String? _subtitle;
  bool _centerTitle = false;
  bool _canPop = true;
  bool _automaticallyImplyLeading = true;
  bool _showActions = false;
  bool _showLeading = false;
  bool _customBackground = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarInternal(
        title: _title,
        subtitle: _subtitle,
        centerTitle: _centerTitle,
        canPop: _canPop,
        automaticallyImplyLeading: _automaticallyImplyLeading,
        backgroundColor: _customBackground ? Colors.blue : null,
        leading: _showLeading
            ? IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => _showSnackBar('Menu tapped!'),
              )
            : null,
        actions: _showActions
            ? [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _showSnackBar('Search tapped!'),
                ),
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () => _showSnackBar('Notifications tapped!'),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => _showSnackBar('More options tapped!'),
                ),
              ]
            : null,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar Preview Section
            _buildSectionTitle('Top Bar Preview'),
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
                    'Current App Bar Configuration:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text('Title: $_title'),
                  if (_subtitle != null) Text('Subtitle: $_subtitle'),
                  Text('Center Title: $_centerTitle'),
                  Text('Can Pop: $_canPop'),
                  Text('Auto Leading: $_automaticallyImplyLeading'),
                  Text('Show Actions: $_showActions'),
                  Text('Show Leading: $_showLeading'),
                  Text('Custom Background: $_customBackground'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // App Bar Controls Section
            _buildSectionTitle('Top Bar Controls'),
            _buildAppBarControls(),
            const SizedBox(height: 24),

            // Examples Section
            _buildSectionTitle('Top Bar Examples'),
            _buildAppBarExamples(),
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

  Widget _buildAppBarControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        _buildControlItem(
          'Title',
          TextField(
            controller: TextEditingController(text: _title),
            onChanged: (value) {
              setState(() {
                _title = value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter title',
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Subtitle
        _buildControlItem(
          'Subtitle',
          TextField(
            controller: TextEditingController(text: _subtitle ?? ''),
            onChanged: (value) {
              setState(() {
                _subtitle = value.isEmpty ? null : value;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter subtitle (optional)',
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Center Title Toggle
        _buildControlItem(
          'Center Title',
          Switch(
            value: _centerTitle,
            onChanged: (value) {
              setState(() {
                _centerTitle = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Can Pop Toggle
        _buildControlItem(
          'Can Pop',
          Switch(
            value: _canPop,
            onChanged: (value) {
              setState(() {
                _canPop = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Automatically Imply Leading Toggle
        _buildControlItem(
          'Auto Leading',
          Switch(
            value: _automaticallyImplyLeading,
            onChanged: (value) {
              setState(() {
                _automaticallyImplyLeading = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Show Actions Toggle
        _buildControlItem(
          'Show Actions',
          Switch(
            value: _showActions,
            onChanged: (value) {
              setState(() {
                _showActions = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Show Leading Toggle
        _buildControlItem(
          'Show Custom Leading',
          Switch(
            value: _showLeading,
            onChanged: (value) {
              setState(() {
                _showLeading = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Custom Background Toggle
        _buildControlItem(
          'Custom Background',
          Switch(
            value: _customBackground,
            onChanged: (value) {
              setState(() {
                _customBackground = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAppBarExamples() {
    return Column(
      children: [
        _buildExampleButton(
          'Simple App Bar',
          () => _showAppBarExample(
            title: 'Simple App Bar',
            centerTitle: true,
          ),
        ),
        _buildExampleButton(
          'App Bar with Subtitle',
          () => _showAppBarExample(
            title: 'App Bar with Subtitle',
            subtitle: 'This is a subtitle',
            centerTitle: true,
          ),
        ),
        _buildExampleButton(
          'App Bar with Actions',
          () => _showAppBarExample(
            title: 'App Bar with Actions',
            showActions: true,
          ),
        ),
        _buildExampleButton(
          'Custom App Bar',
          () => _showAppBarExample(
            title: 'Custom App Bar',
            subtitle: 'With custom styling',
            centerTitle: true,
            showActions: true,
            customBackground: true,
          ),
        ),
        _buildExampleButton(
          'No Back Button',
          () => _showAppBarExample(
            title: 'No Back Button',
            canPop: false,
            showActions: true,
          ),
        ),
      ],
    );
  }

  Widget _buildControlItem(String label, Widget control, [Widget? value]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 8),
        control,
        if (value != null) ...[
          const SizedBox(height: 4),
          value,
        ],
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildExampleButton(String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }

  void _showAppBarExample({
    required String title,
    String? subtitle,
    bool centerTitle = false,
    bool canPop = true,
    bool showActions = false,
    bool customBackground = false,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBarInternal(
            title: title,
            subtitle: subtitle,
            centerTitle: centerTitle,
            canPop: canPop,
            backgroundColor: customBackground ? Colors.blue : null,
            actions: showActions
                ? [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => _showSnackBar('Search tapped!'),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () => _showSnackBar('Notifications tapped!'),
                    ),
                  ]
                : null,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
