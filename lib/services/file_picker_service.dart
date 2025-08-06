// Dart imports:
import 'dart:io';

// Package imports:
import 'package:file_picker/file_picker.dart';

abstract class FilePickerService {
  Future<File?> pickFilePath();

  Future<List<File>> pickFilePaths({
    int maxItems = 3,
  });
}

class FilePickerServiceImpl extends FilePickerService {
  @override
  Future<File?> pickFilePath() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result == null) {
      return null;
    }
    return File(result.files.single.path!);
  }

  @override
  Future<List<File>> pickFilePaths({
    int maxItems = 3,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: maxItems > 1,
      type: FileType.any,
    );
    if (result == null) {
      return [];
    }
    return result.files.map((e) => File(e.path!)).toList();
  }
}
