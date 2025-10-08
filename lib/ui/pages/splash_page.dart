import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = ref.read(prefsProvider);
      final user = prefs.user;
      // final client = ref.read(apiProvider);
      // final response = await client.checkAuth();

      // debugPrint('v1/auth => $response');

      final userLogin = ref.read(userProvider);

      go(
        user?.token != null && user?.token != '' && userLogin != null
            ? Menus.dashboard
            : Menus.login,
      );
    });
  }

  go(AppsMenu menu) {
    menu.go(
      context,
      ref,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(
                size: Dimensions.hugeSize,
              ),
              StaticWidget.vMediumPadding,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Dimensions.giganticSize,
                    child: StaticWidget.loading,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
