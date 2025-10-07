import 'package:abs/models/abs_menu.dart';
import 'package:abs/ui/controller/navigation/routes.dart';
import 'package:abs/ui/widget/illustration.dart';

class Menus {
  static AppsMenu get login => AppsMenu(
        id: AppsMenuId.login,
        title: 'Login',
        route: Routes.login,
        image: null,
      );
  static AppsMenu get splash => AppsMenu(
        id: AppsMenuId.splash,
        title: 'Splash',
        route: Routes.splash,
        image: null,
      );
  static AppsMenu get dashboard => AppsMenu(
        id: AppsMenuId.dashboard,
        title: 'Dashboard',
        route: Routes.dashboard,
        image: null,
      );
  static AppsMenu get profile => AppsMenu(
        id: AppsMenuId.profile,
        title: 'Profil',
        route: Routes.profile,
        image: Illustration.profile,
      );
  static AppsMenu get activity => AppsMenu(
        id: AppsMenuId.activity,
        title: 'Aktivitas',
        route: Routes.activity,
        image: Illustration.activity,
      );
  static AppsMenu get addActivity => AppsMenu(
        id: AppsMenuId.addActivity,
        title: 'Tambah Aktivitas',
        route: Routes.addActivity,
        image: Illustration.activity,
      );
  static AppsMenu get settings => AppsMenu(
        id: AppsMenuId.settings,
        title: 'Pengaturan',
        route: Routes.settings,
        image: null,
      );
  static AppsMenu get registrasi => AppsMenu(
        id: AppsMenuId.registrasi,
        title: 'Registrasi',
        route: Routes.registrasi,
        image: Illustration.registrasi,
      );
  static AppsMenu get sportActivity => AppsMenu(
        id: AppsMenuId.sportActivity,
        title: 'Sport Activities',
        route: Routes.sportActivity,
        image: Illustration.sportActivity,
      );
}
