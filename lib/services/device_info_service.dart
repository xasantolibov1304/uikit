// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:device_info_plus/device_info_plus.dart';

abstract interface class DeviceInfoService {
  FutureOr<String> getDeviceModel();

  FutureOr<String> getOsVersion();

  FutureOr<String> getDeviceId();
}

class DeviceInfoServiceImpl implements DeviceInfoService {
  DeviceInfoServiceImpl();

  String? _deviceModel;
  String? _deviceId;
  String? _osVersion;

  @override
  FutureOr<String> getDeviceModel() async {
    return _dataWrapper<String>(
      () => _deviceModel,
      _deviceModel.toString(),
    );
  }

  @override
  FutureOr<String> getOsVersion() async {
    return _dataWrapper<String>(
      () => _osVersion,
      _osVersion.toString(),
    );
  }

  @override
  FutureOr<String> getDeviceId() async {
    return _dataWrapper<String>(
      () => _deviceId,
      _deviceId.toString(),
    );
  }

  FutureOr<T> _dataWrapper<T>(
    T? Function() getData,
    String paramName,
  ) async {
    if (getData() == null) {
      _fetchData();
    }

    final newData = getData();
    if (newData == null) {
      throw Exception('Failed to fetch $paramName');
    }

    return newData;
  }

  Future<void> _fetchData() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      _deviceModel = androidInfo.model;
      _osVersion = androidInfo.version.release;
      _deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      _deviceModel = iosInfo.utsname.machine;
      _osVersion = iosInfo.systemVersion;
      _deviceId = iosInfo.identifierForVendor;
    } else {
      throw Exception('Unsupported platform');
    }
  }
}
