import 'dart:io';

import 'package:abs/models/activity/activity_list_data.dart';
import 'package:abs/models/activity/actvity_list_response.dart';
import 'package:abs/models/activity/post_activity.dart';
import 'package:abs/models/login/login_response.dart';
import 'package:abs/models/login/me.dart';
import 'package:abs/models/login/me_response.dart';
import 'package:abs/models/login/refresh_response.dart';
import 'package:abs/models/login/refreshed_atuh.dart';
import 'package:abs/models/sport_activities/post_sport_activity.dart';
import 'package:abs/models/sport_activities/sport_activities.dart';
import 'package:abs/models/sport_activities/sport_activities_list_data.dart';
import 'package:abs/models/sport_categories/sport_categories_list_data.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ApiRepository {
  final Ref _ref;

  ApiRepository(this._ref);

  static final format = DateFormat('yyyy-MM-dd');
  static final formatMD = DateFormat('d MMM');

  Future<RefreshedAuth?> checkAuth() async {
    try {
      final client = await _ref.read(dioProvider.future);
      final response = await client.get(
        '/v1/auth',
      );

      return RefreshAuthResponse.fromMap(response.data).data;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> refresh() async {
    try {
      final client = await _ref.read(dioProvider.future);
      final response = await client.get(
        '/v1/auth/refresh',
      );

      return response.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<LoginResponse?> login({
    required String username,
    required String password,
  }) async {
    try {
      // final token = await _ref.read(messagingProvider).getToken();
      final bodyParam = {
        'email': username,
        'password': password,
        // 'fcm_token': 'token',
      };
      final client = await _ref.read(dioProvider.future);
      final response = await client.post(
        '/v1/login',
        data: bodyParam,
      );
      final parsed = LoginResponse.fromMap(response.data,
          statusCode: response.statusCode ?? 0);
      return parsed;
    } catch (error) {
      rethrow;
    }
  }

  Future<Me?> me() async {
    try {
      final client = await _ref.read(dioProvider.future);
      final response = await client.get(
        '/v1/me',
      );

      return MeResponse.fromMap(response.data).data;
    } catch (error) {
      rethrow;
    }
  }

  Future<ActivityListData?> activity({int? page, int? size}) async {
    try {
      final query = {
        'page': page ?? 1,
        'size': size ?? 2,
      };
      final client = await _ref.read(dioProvider.future);
      final response = await client.get(
        '/v1/activity',
        queryParameters: query,
      );

      return ActvityListResponse.fromMap(response.data).data;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> postActivity({required PostActivity post}) async {
    try {
      final client = await _ref.read(dioProvider.future);
      final headers = {...client.options.headers};
      headers[HttpHeaders.contentTypeHeader] = ContentType.json.value;

      final newClient = client.clone(
        options: client.options.copyWith(
          headers: headers,
        ),
      );

      final response = await newClient.post(
        '/v1/activity/',
        data: post.toMap(),
      );

      return response.statusCode == 200;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<SportCategory>?> category() async {
    try {
      final query = {
        'is_paginate': false,
      };
      final client = await _ref.read(dioProvider.future);
      final response = await client.get(
        '/v1/sport-categories',
        queryParameters: query,
      );

      return SportCategoriesListData.fromMap(response.data).result;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<SportActivity>?> sportActivity(int sportCategoryId,
      {int? page, int? perPage}) async {
    try {
      final query = {
        'is_paginate': true,
        'per_page': perPage ?? 10,
        'page': page ?? 0,
        'sport_category_id': sportCategoryId
      };
      final client = await _ref.read(dioProvider.future);
      final response = await client.get(
        '/v1/sport-activities',
        queryParameters: query,
      );

      return SportActivitiesListData.fromMap(response.data).result?.data;
    } catch (error) {
      rethrow;
    }
  }

  Future<dynamic> postSportActivity({required PostSportActivity post}) async {
    try {
      final client = await _ref.read(dioProvider.future);
      final headers = {...client.options.headers};
      headers[HttpHeaders.contentTypeHeader] = ContentType.json.value;

      final newClient = client.clone(
        options: client.options.copyWith(
          headers: headers,
        ),
      );

      final response = await newClient.post(
        '/v1/sport-activities/create',
        data: post.toMap(),
      );

      return response.statusCode == 200;
    } catch (error) {
      rethrow;
    }
  }
}
