import 'package:abs/models/client_config.dart';
import 'package:abs/models/login/logged_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Preferences({required this.prefs});
  late SharedPreferences prefs;

  clear() async {
    await prefs.clear();
  }

  bool? get useDarkness => prefs.getBool('use_darkness');
  set useDarkness(bool? toBeSaved) {
    if (toBeSaved == null) {
      prefs.remove('use_darkness');
    } else {
      prefs.setBool('use_darkness', toBeSaved);
    }
  }

  String? get username => prefs.getString('username');
  set username(String? toBeSaved) {
    if (toBeSaved == null) {
      prefs.remove('username');
    } else {
      prefs.setString('username', toBeSaved);
    }
  }

  String? get password => prefs.getString('password');
  set password(String? toBeSaved) {
    if (toBeSaved == null) {
      prefs.remove('password');
    } else {
      prefs.setString('password', toBeSaved);
    }
  }

  LoggedIn? get user {
    try {
      final string = prefs.getString('user_data');
      if (string == null || string.isEmpty) return null;
      return LoggedIn.fromJson(string);
    } catch (error) {
      debugPrint('/v1/login => error $error');
      return null;
    }
  }

  set user(LoggedIn? toBeSaved) {
    try {
      if (toBeSaved == null) {
        prefs.remove('user_data');
      } else {
        prefs.setString('user_data', toBeSaved.toJson());
      }
    } catch (error) {
      debugPrint('/v1/login => error $error');
    }
  }

  ClientConfig? get config {
    try {
      final string = prefs.getString('config_data');
      if (string == null || string.isEmpty) return null;
      return ClientConfig.fromJson(string);
    } catch (error) {
      debugPrint('client_config => get $error');
      return null;
    }
  }

  set config(ClientConfig? toBeSaved) {
    try {
      if (toBeSaved == null) {
        prefs.remove('config_data');
      } else {
        prefs.setString('config_data', toBeSaved.toJson());
      }
    } catch (error) {
      debugPrint('client_config => save $error');
    }
  }

  DateTime? get timestamp {
    final time = prefs.getInt('timestamp');
    return time == null ? null : DateTime.fromMillisecondsSinceEpoch(time);
  }

  set timestamp(DateTime? toBeSaved) {
    if (toBeSaved == null) {
      prefs.remove('timestamp');
    } else {
      prefs.setInt('timestamp', toBeSaved.millisecondsSinceEpoch);
    }
  }

  int? get lastValidTimezone => prefs.getInt('last_valid_timezone');
  set lastValidTimezone(int? timezoneOffset) {
    if (timezoneOffset == null) return;
    prefs.setInt('last_valid_timezone', timezoneOffset);
  }
}
