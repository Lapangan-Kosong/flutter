import 'package:abs/models/abs_menu.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppsMenuController extends StateNotifier<List<AppsMenu>> {
  final Ref _ref;
  AppsMenuController(this._ref) : super([]) {
    // init
    init();
  }

  Future<void> init() async {
    try {
      final menus = [
        Menus.profile,
        Menus.activity,
        Menus.registrasi,
      ];

      state = menus;
    } catch (error) {
      rethrow;
    }
  }
}
