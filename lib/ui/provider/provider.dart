import 'dart:io';

import 'package:abs/models/activity/activity_list_data.dart';
import 'package:abs/models/client_config.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:abs/models/login/logged_in.dart';
import 'package:abs/models/login/me.dart';
import 'package:abs/models/sport_activities/sport_activities.dart';
import 'package:abs/repositories/api_repository.dart';
import 'package:abs/ui/controller/abs_menu_controller.dart';
import 'package:abs/ui/controller/client_config_controller.dart';
import 'package:abs/ui/controller/theme_controller.dart';
import 'package:abs/ui/controller/user_controller.dart';
import 'package:abs/utils/api_interceptor.dart';
import 'package:abs/utils/preferences.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info_plus/package_info_plus.dart';

const timeoutDuration = Duration(seconds: 5);

final dioProvider = FutureProvider<Dio>(
  (ref) async {
    final token = ref.watch(tokenProvider);
    final config = ref.watch(configProvider);
    final dio = Dio(
      BaseOptions(
        sendTimeout: timeoutDuration,
        connectTimeout: timeoutDuration,
        receiveTimeout: timeoutDuration,
        baseUrl: config.baseUrl,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        validateStatus: (status) {
          if (status == 401) {
            debugPrint('api => 401 caught');
            // ref.read(sessionState.notifier).state = false;
          }
          return true;
        },
      ),
    )..interceptors.add(
        ApiInterceptor(),
      );
    return dio;
  },
);

final tokenProvider = Provider<String?>((ref) {
  final user = ref.watch(userProvider);
  return user?.token;
});

final messagingProvider = Provider((ref) => FirebaseMessaging.instance);

final apiProvider = Provider((ref) => ApiRepository(ref));

final themeProvider = StateNotifierProvider<ThemeController, ThemeData?>(
    (ref) => ThemeController(ref));

final configProvider =
    StateNotifierProvider<ClientConfigController, ClientConfig>(
        (ref) => ClientConfigController(ref));

final prefsProvider = Provider<Preferences>((ref) {
  debugPrint('prefsProvider called');
  throw UnimplementedError();
});

final userProvider = StateNotifierProvider<UserController, LoggedIn?>((ref) {
  debugPrint('userProvider called');
  final api = ref.watch(apiProvider);
  return UserController(ref, api);
});

final menuProvider = StateNotifierProvider<AppsMenuController, List<AppsMenu>>(
    (ref) => AppsMenuController(ref));

final geolocatorLocationServiceProvider = StreamProvider.autoDispose<Position>(
    (ref) => Geolocator.getPositionStream());

final gpsStateProvider = StreamProvider.autoDispose<bool>((ref) {
  return Stream.periodic(const Duration(seconds: 1), (_) async {
    return await Geolocator.isLocationServiceEnabled();
  }).asyncMap((event) => event);
});

final uuidProvider = StateProvider<String?>((ref) => null);

final packageInfoProvider = FutureProvider<PackageInfo>((ref) {
  return PackageInfo.fromPlatform();
});

final profileProvider = FutureProvider<Me?>((ref) async {
  final api = ref.watch(apiProvider);
  return await api.me();
});

final tabActiveProvider =
    StateProvider<String>((ref) => AppsMenuId.dashboard.toString());

final pagedActivityProvider =
    FutureProvider.family<ActivityListData?, int>((ref, page) async {
  try {
    await Future.delayed(Duration(seconds: 5));
    final api = ref.watch(apiProvider);
    final response = await api.activity(page: page);
    return response;
  } catch (err) {
    rethrow;
  }
});

final sportCategoryIdProvider = StateProvider<int>((ref) => 0);
final sportCategoryNameProvider = StateProvider<String>((ref) => "Noname");

final pagedSportActivityProvider =
    FutureProvider.family<List<SportActivity>?, PagedParams>(
        (ref, pagedParams) async {
  try {
    await Future.delayed(Duration(seconds: 5));
    final api = ref.watch(apiProvider);
    final response =
        await api.sportActivity(pagedParams.id, page: pagedParams.page);
    return response;
  } catch (e) {
    rethrow;
  }
});

class PagedParams {
  final int id;
  final int page;
  PagedParams(this.id, this.page);

  @override
  bool operator ==(Object other) =>
      other is PagedParams && other.id == id && other.page == page;

  @override
  int get hashCode => Object.hash(id, page);
}
