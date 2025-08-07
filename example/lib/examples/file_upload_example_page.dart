// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Dart imports:
import 'dart:io';

// Project imports:
import 'package:iman_uikit/uikit.dart';

class FileUploadExamplePage extends StatefulWidget {
  const FileUploadExamplePage({super.key});

  @override
  State<FileUploadExamplePage> createState() => _FileUploadExamplePageState();
}

class _FileUploadExamplePageState extends State<FileUploadExamplePage> {
  final List<FileLoaderItemModel> _files = [];
  bool _isLoading = false;
  double _uploadProgress = 0.0;

  // Initialize services
  late final ImagePickerService _imagePickerService;
  late final FilePickerService _filePickerService;

  @override
  void initState() {
    super.initState();
    _imagePickerService = ImagePickerServiceImpl(
      permissionService: PermissionServiceImpl(),
    );
    _filePickerService = FilePickerServiceImpl();
  }

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
            _buildSectionTitle('File Upload with Cupertino Action Sheet'),
            _buildFileUploadSection(),
            const SizedBox(height: 24),
            _buildSectionTitle('Selected Files'),
            _buildSelectedFilesSection(),
            const SizedBox(height: 24),
            _buildSectionTitle('Examples'),
            _buildExamplesSection(),
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

  Widget _buildFileUploadSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          FileLoader(
            title: 'Upload Files',
            description: 'Select files to upload',
            files: _files,
            selectFileText: 'Choose Files',
            onSelectFile: _showFileSelectionOptions,
          ),
          const SizedBox(height: 16),
          if (_isLoading) ...[
            const SizedBox(height: 16),
            LinearProgressIndicator(value: _uploadProgress),
            const SizedBox(height: 8),
            Text('Uploading... ${(_uploadProgress * 100).toStringAsFixed(1)}%'),
          ],
        ],
      ),
    );
  }

  Widget _buildSelectedFilesSection() {
    if (_files.isEmpty) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: const Text(
          'No files selected',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Column(
      children: _files.map((file) => _buildFileItem(file)).toList(),
    );
  }

  Widget _buildFileItem(FileLoaderItemModel file) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(
            _getFileIcon(file.fileName),
            color: Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.fileName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  file.statusText,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _removeFile(file),
          ),
        ],
      ),
    );
  }

  IconData _getFileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Icons.image;
      default:
        return Icons.insert_drive_file;
    }
  }

  Widget _buildExamplesSection() {
    return Column(
      children: [
        _buildExampleButton(
          'Select Single File',
          () => _showFileSelectionOptions(),
        ),
        _buildExampleButton(
          'Select Multiple Files',
          () => _showFileSelectionOptions(multiple: true),
        ),
        _buildExampleButton(
          'Select Images Only',
          () => _showFileSelectionOptions(fileType: 'image'),
        ),
        _buildExampleButton(
          'Select Documents Only',
          () => _showFileSelectionOptions(fileType: 'document'),
        ),
        _buildExampleButton(
          'Simulate Upload',
          () => _simulateUpload(),
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

  void _showFileSelectionOptions({bool multiple = false, String? fileType}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CommonCupertinoActionSheet(
        title: 'Select File Source',
        actions: [
          CupertinoActionItem(
            label: 'Camera',
            onPressed: () {
              Navigator.pop(context);
              _pickFileFromCamera();
            },
          ),
          CupertinoActionItem(
            label: 'Photo Library',
            onPressed: () {
              Navigator.pop(context);
              _pickFileFromGallery(fileType: fileType);
            },
          ),
          CupertinoActionItem(
            label: 'Document Picker',
            onPressed: () {
              Navigator.pop(context);
              _pickFileFromDocumentPicker(multiple: multiple);
            },
          ),
        ],
        cancelButton: CupertinoActionItem(
          label: 'Cancel',
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Future<void> _pickFileFromCamera() async {
    try {
      final file =
          await _imagePickerService.pickImageFile(AppImageSource.camera);
      if (file != null) {
        _addFile(file);
      }
    } catch (e) {
      _showErrorSnackBar('Error picking image from camera: $e');
    }
  }

  Future<void> _pickFileFromGallery({String? fileType}) async {
    try {
      List<File>? files;
      if (fileType == 'image') {
        files = await _imagePickerService.pickMultipleImageFiles();
      } else {
        files = await _imagePickerService.pickMultipleMediaFiles();
      }

      if (files != null && files.isNotEmpty) {
        for (final file in files) {
          _addFile(file);
        }
      }
    } catch (e) {
      _showErrorSnackBar('Error picking files from gallery: $e');
    }
  }

  Future<void> _pickFileFromDocumentPicker({bool multiple = false}) async {
    try {
      List<File> files;
      if (multiple) {
        files = await _filePickerService.pickFilePaths(maxItems: 5);
      } else {
        final file = await _filePickerService.pickFilePath();
        files = file != null ? [file] : [];
      }

      for (final file in files) {
        _addFile(file);
      }
    } catch (e) {
      _showErrorSnackBar('Error picking documents: $e');
    }
  }

  void _addFile(File file) {
    final fileName = file.path.split('/').last;
    final fileSize = _formatFileSize(file.lengthSync());

    final fileModel = FileLoaderItemModel(
      fileName: fileName,
      progress: 0.0,
      progressType: LinearProgressIndicatorType.neutral,
      statusText: fileSize,
    );

    setState(() {
      _files.add(fileModel);
    });

    _showSuccessSnackBar('File added: $fileName');
  }

  void _removeFile(FileLoaderItemModel file) {
    setState(() {
      _files.remove(file);
    });
    _showSuccessSnackBar('File removed: ${file.fileName}');
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024)
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  void _simulateUpload() async {
    if (_files.isEmpty) {
      _showErrorSnackBar('No files to upload');
      return;
    }

    setState(() {
      _isLoading = true;
      _uploadProgress = 0.0;
    });

    // Simulate upload progress
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      if (mounted) {
        setState(() {
          _uploadProgress = i / 100;
        });
      }
    }

    setState(() {
      _isLoading = false;
    });

    _showSuccessSnackBar('Upload completed successfully!');
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
