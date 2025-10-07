import 'package:abs/models/activity/activity_list_data.dart';
import 'package:abs/models/login/user.dart';
import 'package:abs/repositories/api_repository.dart';
import 'package:abs/ui/controller/navigation/routes.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/login/login_response.dart';

class UserController extends StateNotifier<AsyncValue<ActivityListData?>> {
  final Ref _ref;
  final ApiRepository _api;
  final int page;
  UserController(this._ref, this._api, this.page) : super(AsyncData(null)) {
    // init
    init();
  }

  Future<void> init() async {
    try {
      state = AsyncLoading();
      final response = await _api.activity(page: page);
      state = AsyncData(response);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      rethrow;
    }
  }
}
