// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:uikit/uikit.dart';

class OverlayLoaderExamplePage extends StatefulWidget {
  const OverlayLoaderExamplePage({super.key});

  @override
  State<OverlayLoaderExamplePage> createState() =>
      _OverlayLoaderExamplePageState();
}

class _OverlayLoaderExamplePageState extends State<OverlayLoaderExamplePage> {
  bool _showOverlay = false;
  bool _showProgress = false;
  double _progress = 0.0;
  String _title = 'Loading...';
  String _description = 'Please wait while we process your request';
  String _buttonText = 'Cancel';
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _startProgressSimulation();
  }

  void _startProgressSimulation() {
    if (_showProgress) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted && _showProgress) {
          setState(() {
            _progress += 0.01;
            if (_progress >= 1.0) {
              _progress = 0.0;
            }
          });
          _startProgressSimulation();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Overlay Loader Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Overlay Loader Preview'),
                _buildPreviewSection(),
                const SizedBox(height: 24),
                _buildSectionTitle('Controls'),
                _buildControlsSection(),
                const SizedBox(height: 24),
                _buildSectionTitle('Examples'),
                _buildExamplesSection(),
              ],
            ),
          ),
          if (_showOverlay) _buildOverlayLoader(),
        ],
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

  Widget _buildPreviewSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text('Current Configuration:'),
          const SizedBox(height: 8),
          Text('Title: $_title'),
          Text('Description: $_description'),
          Text('Show Progress: $_showProgress'),
          if (_showProgress)
            Text('Progress: ${(_progress * 100).toStringAsFixed(1)}%'),
          Text('Show Button: $_showButton'),
          if (_showButton) Text('Button Text: $_buttonText'),
        ],
      ),
    );
  }

  Widget _buildControlsSection() {
    return Column(
      children: [
        _buildTextField(
          'Title',
          _title,
          (value) => setState(() => _title = value),
        ),
        const SizedBox(height: 16),
        _buildTextField(
          'Description',
          _description,
          (value) => setState(() => _description = value),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CheckboxListTile(
                title: const Text('Show Progress'),
                value: _showProgress,
                onChanged: (value) {
                  setState(() {
                    _showProgress = value ?? false;
                    if (_showProgress) {
                      _startProgressSimulation();
                    }
                  });
                },
              ),
            ),
            Expanded(
              child: CheckboxListTile(
                title: const Text('Show Button'),
                value: _showButton,
                onChanged: (value) {
                  setState(() {
                    _showButton = value ?? false;
                  });
                },
              ),
            ),
          ],
        ),
        if (_showButton)
          _buildTextField(
            'Button Text',
            _buttonText,
            (value) => setState(() => _buttonText = value),
          ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _showOverlay = true;
              });
            },
            child: const Text('Show Overlay Loader'),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(
      String label, String value, Function(String) onChanged) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      controller: TextEditingController(text: value),
      onChanged: onChanged,
    );
  }

  Widget _buildExamplesSection() {
    return Column(
      children: [
        _buildExampleButton(
          'Simple Loading',
          () => _showExampleOverlay(
            title: 'Loading...',
            description: 'Please wait',
          ),
        ),
        _buildExampleButton(
          'With Progress',
          () => _showExampleOverlay(
            title: 'Uploading Files',
            description: 'Processing your files',
            showProgress: true,
          ),
        ),
        _buildExampleButton(
          'With Cancel Button',
          () => _showExampleOverlay(
            title: 'Processing',
            description: 'This may take a while',
            showButton: true,
            buttonText: 'Cancel',
          ),
        ),
        _buildExampleButton(
          'Complete Example',
          () => _showExampleOverlay(
            title: 'Syncing Data',
            description: 'Synchronizing with server',
            showProgress: true,
            showButton: true,
            buttonText: 'Stop Sync',
          ),
        ),
      ],
    );
  }

  Widget _buildExampleButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }

  void _showExampleOverlay({
    String? title,
    String? description,
    bool showProgress = false,
    bool showButton = false,
    String? buttonText,
  }) {
    setState(() {
      _title = title ?? 'Loading...';
      _description = description ?? 'Please wait';
      _showProgress = showProgress;
      _showButton = showButton;
      _buttonText = buttonText ?? 'Cancel';
      _showOverlay = true;
    });
  }

  Widget _buildOverlayLoader() {
    return Center(
      child: OverlayLoader(
        title: _title,
        description: _description,
        progress: _showProgress ? _progress : null,
        buttonText: _showButton ? _buttonText : null,
        onButtonTap:
            _showButton ? () => setState(() => _showOverlay = false) : null,
      ),
    );
  }
}
