import 'package:abs/ui/pages/activity_page.dart';
import 'package:abs/ui/pages/add_activity_page.dart';
import 'package:abs/ui/pages/add_sport_activity_page.dart';
import 'package:abs/ui/pages/dashboard_page.dart';
import 'package:abs/ui/pages/login_page.dart';
import 'package:abs/ui/pages/profil_page.dart';
import 'package:abs/ui/pages/update_profile_page.dart';
import 'package:abs/ui/pages/registration_page.dart';
import 'package:abs/ui/pages/settings_page.dart';
import 'package:abs/ui/pages/splash_page.dart';
import 'package:abs/ui/pages/sport_activity_page.dart';
import 'package:abs/ui/pages/unknown_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String updateProfile = '/profile/update';
  static const String activity = '/activity';
  static const String addActivity = '/addActivity';
  static const String presensi = '/presensi';
  static const String pengajuanPresensi = '/pengajuanPresensi';
  static const String settings = '/settings';
  static const String daftarPegawai = '/daftarPegawai';
  // static const String profil = '/profil';
  static const String registrasi = '/registrasi';
  static const String sportActivity = '/sportActivity';
  static const String addSportActivity = '/sportActivity/add';

  static const List<String> allRoutes = [
    splash,
    login,
    dashboard,
    profile,
    activity,
    presensi,
    pengajuanPresensi,
  ];

  static Route getMaterialPageRoutes(RouteSettings settings) {
    final map = settings.arguments as Map<String, dynamic>?;

    final intQuery = map?['int_query'];
    final boolQuery = map?['bool_query'];
    final title = map?['title'];

    final pegawai = map?['pegawai'];
    final nip = map?['nip'];

    final routes = <String, WidgetBuilder>{
      Routes.splash: (ctx) => const SplashPage(),
      Routes.login: (ctx) => const LoginPage(),
      Routes.dashboard: (ctx) => const DashboardPage(),
      Routes.profile: (ctx) => ProfilPage(),
      Routes.updateProfile: (ctx) => const UpdateProfilePage(),
      Routes.registrasi: (ctx) => const RegistrationPage(),
      Routes.sportActivity: (ctx) => const SportActivityPage(),
      Routes.addSportActivity: (ctx) => const AddSportActivityPage(),
    };

    WidgetBuilder? routeBuilder = routes[settings.name];
    return MaterialPageRoute(builder: (ctx) {
      return routeBuilder == null ? const UnknownPage() : routeBuilder(ctx);
    });
  }
}
