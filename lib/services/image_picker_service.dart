// Dart imports:
import 'dart:io';

// Package imports:
import 'package:image_picker/image_picker.dart';

// Project imports:
import 'package:iman_uikit/services/permission_service.dart';

enum AppImageSource {
  camera,
  gallery,
}

abstract class ImagePickerService {
  Future<File?> pickImageFile(AppImageSource appImageSource);
  Future<List<File>?> pickMultipleImageFiles();

  Future<File?> pickVideoFile(AppImageSource appImageSource);
  Future<File?> pickMediaFile({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  });

  Future<List<File>?> pickMultipleMediaFiles({
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  });
}

class ImagePickerServiceImpl extends ImagePickerService {
  final PermissionService _permissionService;

  ImagePickerServiceImpl({
    required PermissionService permissionService,
  }) : _permissionService = permissionService;

  @override
  Future<File?> pickImageFile(
    AppImageSource appImageSource, {
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  }) async {
    bool canProceed = await _handleImagePickPermissions(appImageSource);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final file = await imagePicker.pickImage(
        source: ImageSource.values.byName(appImageSource.name),
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        imageQuality: imageQuality,
      );

      if (file != null) {
        return File(file.path);
      }
    }
    return null;
  }

  @override
  Future<List<File>?> pickMultipleImageFiles({
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  }) async {
    bool canProceed = await _handleImagePickPermissions(AppImageSource.gallery);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final files = await imagePicker.pickMultiImage(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (files.isNotEmpty) {
        return files.map((e) => File(e.path)).toList();
      }
    }
    return null;
  }

  @override
  Future<File?> pickVideoFile(
    AppImageSource appImageSource, {
    Duration? maxDuration,
    double? maxWidth,
  }) async {
    bool canProceed = await _handleImagePickPermissions(appImageSource);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final file = await imagePicker.pickVideo(
        source: ImageSource.values.byName(appImageSource.name),
        maxDuration: maxDuration,
      );

      if (file != null) {
        return File(file.path);
      }
    }
    return null;
  }

  @override
  Future<File?> pickMediaFile({
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
  }) async {
    final imagePicker = ImagePicker();

    final file = await imagePicker.pickMedia(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      imageQuality: imageQuality,
    );

    if (file != null) {
      return File(file.path);
    }

    return null;
  }

  @override
  Future<List<File>?> pickMultipleMediaFiles({
    double? maxHeight,
    double? maxWidth,
    int? imageQuality,
  }) async {
    bool canProceed = await _handleImagePickPermissions(AppImageSource.gallery);

    if (canProceed) {
      final imagePicker = ImagePicker();

      final files = await imagePicker.pickMultipleMedia(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: imageQuality,
      );

      if (files.isNotEmpty) {
        return files.map((e) => File(e.path)).toList();
      }
    }
    return null;
  }

  //

  Future<bool> _handleImagePickPermissions(AppImageSource imageSource) async {
    if (imageSource == AppImageSource.camera) {
      return await _permissionService.isCameraGranted();
    } else if (imageSource == AppImageSource.gallery) {
      return await _permissionService.isGalleryGranted();
    } else {
      return false;
    }
  }
}
