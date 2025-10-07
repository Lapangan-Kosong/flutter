import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/register/register.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

final _nameProvider = StateProvider<String>((ref) => '');
final _emailProvider = StateProvider<String>((ref) => '');
final _phoneProvider = StateProvider<String>((ref) => '');
final _passwordProvider = StateProvider<String>((ref) => '');
final _confirmProvider = StateProvider<String>((ref) => '');
final _isRegisteringProvider = StateProvider<bool>((ref) => false);
final _emailErrorProvider = StateProvider<String?>((ref) => null);

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final name = ref.watch(_nameProvider);
    final email = ref.watch(_emailProvider);
    final phone = ref.watch(_phoneProvider);
  final pass = ref.watch(_passwordProvider);
  final confirm = ref.watch(_confirmProvider);
  final isRegistering = ref.watch(_isRegisteringProvider);
  final emailError = ref.watch(_emailErrorProvider);

  final messenger = ScaffoldMessenger.of(context);

  final isEnabled =
    name.isNotEmpty && email.isNotEmpty && pass.isNotEmpty && !isRegistering && pass == confirm;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.mediumSize),
                  child: Text(
                    'Buat akun baru',
                    style: textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                StaticWidget.vMediumPadding,
                _InputField(
                  hint: 'Nama',
                  onChanged: (v) => ref.read(_nameProvider.notifier).state = v,
                  errorText: null,
                ),
                _InputField(
                  hint: 'Email',
                  onChanged: (v) {
                    ref.read(_emailProvider.notifier).state = v;
                    ref.read(_emailErrorProvider.notifier).state = null;
                  },
                  errorText: emailError,
                ),
                _InputField(
                  hint: 'No. Telepon',
                  onChanged: (v) => ref.read(_phoneProvider.notifier).state = v,
                  errorText: null,
                ),
                _InputField(
                  hint: 'Password',
                  obscureText: true,
                  onChanged: (v) => ref.read(_passwordProvider.notifier).state = v,
                  errorText: null,
                ),
                _InputField(
                  hint: 'Konfirmasi Password',
                  obscureText: true,
                  onChanged: (v) => ref.read(_confirmProvider.notifier).state = v,
                  errorText: null,
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimensions.mediumSize),
                  child: InkWell(
                    onTap: isEnabled
                        ? () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            ref.read(_isRegisteringProvider.notifier).state = true;
                            try {
                              final api = ref.read(apiProvider);
                              final RegisterResponse? result = await api.register(
                                email: email,
                                name: name,
                                password: pass,
                                c_password: confirm,
                                phone_number: phone,
                              );

                              if (result != null && result.success) {
                                messenger.showSnackBar(
                                  SnackBar(content: Text('Registrasi berhasil. Selamat, ${result.data?.name ?? ''}')),
                                );
                                // navigate to login
                                if (context.mounted) {
                                  Menus.login.go(context, ref, replace: true);
                                }
                              } else {
                                final apiMsg = result?.message ?? 'Tidak diketahui';
                                final lower = apiMsg.toLowerCase();
                                // detect email already used message
                                if (lower.contains('terpakai') || (lower.contains('email') && lower.contains('ganti')) ) {
                                  ref.read(_emailErrorProvider.notifier).state = apiMsg;
                                } else {
                                  messenger.showSnackBar(
                                    SnackBar(content: Text('Gagal registrasi: $apiMsg')),
                                  );
                                }
                              }
                            } catch (error) {
                              messenger.showSnackBar(
                                SnackBar(content: Text('Terjadi kesalahan saat registrasi.${kDebugMode ? ' ' + error.toString() : ''}')),
                              );
                            } finally {
                              // reset registering flag
                              ref.read(_isRegisteringProvider.notifier).state = false;
                            }
                          }
                        : null,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: Dimensions.commonCircularCorner,
                        border: Border.all(
                            color: isEnabled ? colorScheme.onSurface : theme.disabledColor),
                      ),
                      padding: const EdgeInsets.all(Dimensions.smallSize),
                      child: isRegistering
                          ? SizedBox(
                              width: Dimensions.mediumSize,
                              height: Dimensions.mediumSize,
                              child: FittedBox(child: CircularProgressIndicator()),
                            )
                          : Text(
                              'Daftar',
                              style: textTheme.titleSmall?.copyWith(
                                color: isEnabled ? null : theme.disabledColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ),
                StaticWidget.vSmallPadding,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends ConsumerStatefulWidget {
  const _InputField({required this.hint, required this.onChanged, this.obscureText = false, this.errorText});
  final String hint;
  final bool obscureText;
  final Function(String) onChanged;
  final String? errorText;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputFieldState();
}

class _InputFieldState extends ConsumerState<_InputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.tinySize,
        horizontal: Dimensions.mediumSize,
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.hint,
          errorText: widget.errorText,
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
