// Dart imports:
import 'dart:async';

// Package imports:
import 'package:permission_handler/permission_handler.dart';

abstract interface class PermissionService {
  FutureOr<bool> isCameraGranted();

  FutureOr<bool> isGalleryGranted();

  FutureOr<bool> isStorageGranted();

  FutureOr<bool> isLocationGranted();

  FutureOr<bool> isNotificationsGranted();
}

class PermissionServiceImpl implements PermissionService {
  @override
  FutureOr<bool> isCameraGranted() async {
    var status = await Permission.camera.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.camera.request();
    }

    return status.isGranted;
  }

  @override
  FutureOr<bool> isGalleryGranted() async {
    var status = await Permission.photos.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.photos.request();
    }

    return status.isGranted;
  }

  @override
  FutureOr<bool> isStorageGranted() async {
    var status = await Permission.storage.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.storage.request();
    }

    return status.isGranted;
  }

  @override
  FutureOr<bool> isLocationGranted() async {
    var status = await Permission.location.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.location.request();
    }

    return status.isGranted;
  }

  @override
  FutureOr<bool> isNotificationsGranted() async {
    var status = await Permission.notification.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.notification.request();
    }

    return status.isGranted;
  }
}
