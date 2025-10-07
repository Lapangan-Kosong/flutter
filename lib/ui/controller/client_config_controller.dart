import 'package:abs/models/client_config.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final defaultClientConfig = ClientConfig(
  primaryColor: Colors.green,
  secondaryColor: Colors.purple,
  baseUrl: 'https://sport-reservation-api-bootcamp.do.dibimbing.id/api',
  logo: 'assets/images/logo.png',
  background: 'assets/images/background.png',
);

class ClientConfigController extends StateNotifier<ClientConfig> {
  final Ref _ref;
  ClientConfigController(this._ref) : super(defaultClientConfig) {
    // init
    debugPrint('client_config => initiatiing controller');
    init();
  }

  Future<void> init() async {
    try {
      final prefs = _ref.read(prefsProvider);
      final config = prefs.config;
      if (config == null) {
        debugPrint('client_config => config is null, populating default');
        prefs.config = defaultClientConfig;
      }
      state = config ?? defaultClientConfig;
    } catch (error) {
      debugPrint('client_config => $error');
      rethrow;
    }
  }

  updateConfig(ClientConfig config) {
    final prefs = _ref.read(prefsProvider);
    prefs.config = config;
    state = config;
  }
}
