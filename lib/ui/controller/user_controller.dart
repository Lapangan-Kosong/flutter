import 'package:abs/models/login/logged_in.dart';
import 'package:abs/repositories/api_repository.dart';
import 'package:abs/ui/controller/navigation/routes.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/login/login_response.dart';

class UserController extends StateNotifier<LoggedIn?> {
  final Ref _ref;
  final ApiRepository _api;
  UserController(this._ref, this._api) : super(null) {
    // init
    init();
  }

  Future<void> init() async {
    try {
      final prefs = _ref.read(prefsProvider);
      final user = prefs.user;

      final uuid = user?.name;
      if (uuid != null) {
        _ref.read(uuidProvider.notifier).state = uuid;
      }
      state = user;
    } catch (error) {
      rethrow;
    }
  }

  Future<LoginResponse?> login({
    required String user,
    required String pass,
  }) async {
    try {
      debugPrint('/v1/login => getting client');
      final client = _api;
      debugPrint('/v1/login => getting prefs');
      final prefs = _ref.read(prefsProvider);

      debugPrint('/v1/login => logging in');
      final loginResponse = await client.login(
        username: user,
        password: pass,
      );
      debugPrint('/v1/login => response get');
      debugPrint('/v1/login => response ${loginResponse?.user}');

      if (loginResponse == null || loginResponse.status != 200) {
        state = null;
        prefs.user = null;
        throw 'Login gagal';
      }

      debugPrint('/v1/login => controller ${loginResponse.user}');
      // save to prefs
      prefs.user = loginResponse.user;
      prefs.username = user;
      prefs.password = pass;
      debugPrint('/v1/login => prefs ${prefs.user}');
      // save to cache
      state = loginResponse.user;
      debugPrint('/v1/login => saved to cache');
      return loginResponse;
    } catch (error) {
      debugPrint('/v1/login => error $error');
      rethrow;
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      final prefs = _ref.read(prefsProvider);
      prefs.user = null;

      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.login,
        (r) => false,
      );

      // Invalidate all providers except prefsProvider
      _ref.invalidate(userProvider);
      _ref.invalidate(tokenProvider);
      // _ref.invalidate(dioProvider);
      // _ref.invalidate(apiProvider);
      // _ref.invalidate(themeProvider);
      // _ref.invalidate(menuProvider);
      _ref.invalidate(provinceProvider);
      _ref.invalidate(profileProvider);
      _ref.invalidate(tabActiveProvider);
      _ref.invalidate(pagedActivityProvider);
      _ref.invalidate(sportCategoryIdProvider);
      _ref.invalidate(sportCategoryNameProvider);
      _ref.invalidate(pagedSportActivityProvider);
    } catch (error) {
      rethrow;
    }
  }
}
