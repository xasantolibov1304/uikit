// Dart imports:
import 'dart:async';

// Package imports:
import 'package:package_info_plus/package_info_plus.dart';

abstract interface class PackageInfoService {
  FutureOr<int> getBuildVersion();

  FutureOr<String> getAppVersion();

  FutureOr<String> getFormattedAppVersion();
}

class PackageInfoServiceImpl implements PackageInfoService {
  PackageInfoServiceImpl();

  int? _buildVersion;
  String? _appVersion;

  @override
  FutureOr<int> getBuildVersion() async {
    return _dataWrapper<int>(
      () => _buildVersion,
      _buildVersion.toString(),
    );
  }

  @override
  FutureOr<String> getAppVersion() async {
    return _dataWrapper<String>(
      () => _appVersion,
      _appVersion.toString(),
    );
  }

  @override
  FutureOr<String> getFormattedAppVersion() async {
    final buildVersion = await getBuildVersion();
    final appVersion = await getAppVersion();

    return '$appVersion ($buildVersion)';
  }

  FutureOr<T> _dataWrapper<T>(
    T? Function() getData,
    String paramName,
  ) async {
    if (getData() == null) {
      await _fetchData();
    }

    final newData = getData();
    if (newData == null) {
      throw Exception('Failed to fetch $paramName');
    }

    return newData;
  }

  Future<void> _fetchData() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _buildVersion = int.tryParse(packageInfo.buildNumber) ?? 1;
    _appVersion = packageInfo.version;
  }
}
