import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/ui/widget/backdrop.dart';
import 'package:abs/ui/widget/logo.dart';
import 'package:abs/ui/widget/page_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

final _userProvider = StateProvider<String>((ref) => '');
final _passProvider = StateProvider<String>((ref) => '');
final _isLoggingInProvider = StateProvider<bool>((ref) => false);

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final prefs = ref.watch(prefsProvider);
      final user = prefs.username ?? '';
      final pass = prefs.password ?? '';

      ref.read(_userProvider.notifier).state = user;
      ref.read(_passProvider.notifier).state = pass;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final user = ref.watch(_userProvider);
    final pass = ref.watch(_passProvider);
    final isLoggingin = ref.watch(_isLoggingInProvider);

    final messenger = ScaffoldMessenger.of(context);
    final prefs = ref.watch(prefsProvider);

    final isEnabled = user.isNotEmpty && pass.isNotEmpty && !isLoggingin;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageTitle(
              // menu: Menus.dashboard,
              withBackButton: false,
              actions: [
                IconButton(
                  onPressed: () => Menus.settings.go(
                    context,
                    ref,
                  ),
                  icon: Icon(
                    Icons.settings_rounded,
                    // color: colorScheme.onPrimary,
                  ),
                )
              ],
              // withLogo: true,
              // color: colorScheme.primary,
            ),
            Backdrop(),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/json/sports.json',
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  StaticWidget.hSmallPadding,
                  Text(
                    'Lapangan Kosong',
                    style: textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  StaticWidget.vLargePadding,
                  _LoginInput(
                    hint: 'Email',
                    initVal: prefs.username,
                    onChanged: (input) =>
                        ref.read(_userProvider.notifier).state = input,
                  ),
                  _LoginInput(
                    hint: 'Password',
                    initVal: prefs.password,
                    obscureText: true,
                    onChanged: (input) =>
                        ref.read(_passProvider.notifier).state = input,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(Dimensions.mediumSize),
                    child: InkWell(
                      onTap: isEnabled
                          ? () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              ref.read(_isLoggingInProvider.notifier).state =
                                  true;
                              ref
                                  .read(userProvider.notifier)
                                  .login(
                                    user: user,
                                    pass: pass,
                                  )
                                  .then((result) {
                                debugPrint('/v1/login => result $result');
                                final user = ref.read(userProvider);
                                debugPrint('/v1/login => user $user');
                                if (context.mounted) {
                                  Menus.dashboard.go(
                                    context,
                                    ref,
                                    replace: true,
                                  );
                                }
                              }).catchError((error) {
                                messenger.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Gagal melakukan login. Silakan coba lagi.${kDebugMode ? error.toString() : ''}',
                                    ),
                                  ),
                                );
                              }).whenComplete(() {
                                ref.invalidate(_isLoggingInProvider);
                              });
                            }
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: Dimensions.commonCircularCorner,
                          border: Border.all(
                              color: isEnabled
                                  ? colorScheme.onSurface
                                  : theme.disabledColor),
                        ),
                        padding: const EdgeInsets.all(Dimensions.smallSize),
                        child: isLoggingin
                            ? SizedBox(
                                width: Dimensions.mediumSize,
                                height: Dimensions.mediumSize,
                                child: FittedBox(
                                    child: CircularProgressIndicator()),
                              )
                            : Text(
                                'Login',
                                style: textTheme.titleSmall?.copyWith(
                                  color: isEnabled ? null : theme.disabledColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      ),
                    ),
                  ),
                  StaticWidget.vMediumPadding,
                  InkWell(
                    onTap: () {
                      Menus.registrasi.go(
                        context,
                        ref,
                        replace: false,
                      );
                    },
                    child: Text(
                      'Registrasi akun baru',
                      style: textTheme.titleSmall?.copyWith(
                          color: isEnabled ? null : theme.disabledColor,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  StaticWidget.vSmallPadding,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _controllerProvider = StateProvider.autoDispose
    .family<TextEditingController, String>((ref, hint) {
  final controller = TextEditingController();
  ref.onDispose(() {
    controller.dispose();
  });
  return controller;
});

class _LoginInput extends ConsumerStatefulWidget {
  const _LoginInput({
    required this.hint,
    this.initVal,
    required this.onChanged,
    this.obscureText = false,
  });
  final String hint;
  final String? initVal;
  final Function(String) onChanged;

  final dynamic obscureText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginInputState();
}

class _LoginInputState extends ConsumerState<_LoginInput> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(_controllerProvider(widget.hint)).text = widget.initVal ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(_controllerProvider(widget.hint));
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.tinySize,
        horizontal: Dimensions.mediumSize,
      ),
      child: TextField(
        scrollPadding: const EdgeInsets.all(0),
        controller: controller,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          isDense: true,
          contentPadding: const EdgeInsets.all(Dimensions.smallSize),
          border: OutlineInputBorder(
            borderRadius: Dimensions.commonCircularCorner,
          ),
        ),
      ),
    );
  }
}
