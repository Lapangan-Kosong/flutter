import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends ConsumerStatefulWidget {
  const RegistrationPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationPageState();
}

class _RegistrationPageState extends ConsumerState<RegistrationPage> {
  @override
  void initState() {
    super.initState();
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
              Lottie.asset(
                'assets/json/sports.json',
                height: Dimensions.giganticSize,
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
              StaticWidget.vMediumPadding,
              Text("Under Construction", textAlign: TextAlign.center)
            ],
          ),
        ),
      ),
    );
  }
}
