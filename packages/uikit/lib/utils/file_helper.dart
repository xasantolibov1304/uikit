// Dart imports:
import 'dart:math';

// Package imports:
import 'package:path/path.dart' as p;

enum FileType {
  pdf,
  doc,
  xlsx,
  png,
  jpeg,
  jpg,
  other,
}

class FileHelper {
  const FileHelper._();

  static FileType getFileType(String path) {
    final ext = p.extension(path);
    return switch (ext) {
      '.pdf' => FileType.pdf,
      '.doc' => FileType.doc,
      '.xlsx' => FileType.xlsx,
      '.jpeg' => FileType.jpeg,
      '.jpg' => FileType.jpg,
      '.png' => FileType.png,
      _ => FileType.other,
    };
  }

  static String getFileName(String path) {
    return p.basename(path);
  }

  static String getFileSizeString(int bytes, {int decimals = 2}) {
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (bytes == 0) ? 0 : (log(bytes) / log(1024)).floor();
    final size = bytes / pow(1024, i);
    return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}
