import 'package:flutter/services.dart';

class TimezoneService {
  static const platform = MethodChannel('main');

  Future<bool> getAndroidAutoTime() async {
    try {
      return await platform.invokeMethod('getTimezone');
    } catch (e) {
      // rethrow;
      return true;
    }
  }
}
