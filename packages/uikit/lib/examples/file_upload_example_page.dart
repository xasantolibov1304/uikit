// Flutter imports:
import 'dart:async';
import 'package:flutter/material.dart';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class FileUploadExamplePage extends StatefulWidget {
  const FileUploadExamplePage({super.key});

  @override
  State<FileUploadExamplePage> createState() => _FileUploadExamplePageState();
}

class _FileUploadExamplePageState extends State<FileUploadExamplePage> {
  // File properties
  String _fileName = 'document.pdf';
  String _fileSize = '2.5 MB';
  double? _percentage;
  bool _showTrailing = false;
  bool _showProgress = false;

  final List<String> _sampleFiles = [
    'document.pdf',
    'image.jpg',
    'spreadsheet.xlsx',
    'presentation.pptx',
    'text.txt',
    'archive.zip',
  ];

  final List<String> _sampleSizes = [
    '2.5 MB',
    '1.8 MB',
    '3.2 MB',
    '5.1 MB',
    '256 KB',
    '12.7 MB',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // File Upload Preview Section
            _buildSectionTitle('File Upload Preview'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  FileUpload(
                    fileName: _fileName,
                    fileSize: _showProgress ? null : _fileSize,
                    percentage: _showProgress ? _percentage : null,
                    trailing: _showTrailing
                        ? IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => _showSnackBar('File removed!'),
                          )
                        : null,
                  ),
                  const SizedBox(height: 16),
                  // Multiple files example
                  ...List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: FileUpload(
                              fileName: _sampleFiles[index + 1],
                              fileSize: _sampleSizes[index + 1],
                              trailing: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => _showSnackBar(
                                    '${_sampleFiles[index + 1]} removed!'),
                              ),
                            ),
                          )),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // File Upload Controls Section
            _buildSectionTitle('File Upload Controls'),
            _buildFileUploadControls(),
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

  Widget _buildFileUploadControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // File Name
        _buildControlItem(
          'File Name',
          DropdownButtonFormField<String>(
            value: _fileName,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: _sampleFiles
                .map((file) => DropdownMenuItem(
                      value: file,
                      child: Text(file),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _fileName = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // File Size
        _buildControlItem(
          'File Size',
          DropdownButtonFormField<String>(
            value: _fileSize,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: _sampleSizes
                .map((size) => DropdownMenuItem(
                      value: size,
                      child: Text(size),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _fileSize = value!;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Show Progress Toggle
        _buildControlItem(
          'Show Progress',
          Switch(
            value: _showProgress,
            onChanged: (value) {
              setState(() {
                _showProgress = value;
                if (value) {
                  _percentage = 0.0;
                }
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Progress Percentage (only show if progress is enabled)
        if (_showProgress) ...[
          _buildControlItem(
            'Progress Percentage',
            Slider(
              value: _percentage ?? 0.0,
              min: 0,
              max: 1,
              divisions: 100,
              onChanged: (value) {
                setState(() {
                  _percentage = value;
                });
              },
            ),
            Text('${((_percentage ?? 0.0) * 100).toStringAsFixed(1)}%'),
          ),
          const SizedBox(height: 16),
        ],

        // Show Trailing Toggle
        _buildControlItem(
          'Show Trailing Icon',
          Switch(
            value: _showTrailing,
            onChanged: (value) {
              setState(() {
                _showTrailing = value;
              });
            },
          ),
        ),
        const SizedBox(height: 16),

        // Simulate Upload Button
        _buildControlItem(
          'Simulate Upload',
          ElevatedButton(
            onPressed: _showProgress ? _simulateUpload : null,
            child: const Text('Start Upload Simulation'),
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

  void _simulateUpload() {
    if (!_showProgress) return;

    setState(() {
      _percentage = 0.0;
    });

    const duration = Duration(milliseconds: 100);
    Timer.periodic(duration, (timer) {
      setState(() {
        final newValue = (_percentage ?? 0.0) + 0.02;
        _percentage = newValue.clamp(0.0, 1.0);
      });

      if ((_percentage ?? 0.0) >= 1.0) {
        timer.cancel();
        _showSnackBar('Upload completed!');
      }
    });
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
