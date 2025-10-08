import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/ui/widget/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/models/login/me.dart';
import 'package:lottie/lottie.dart';

class UpdateProfilePage extends ConsumerStatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  ConsumerState<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends ConsumerState<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    // Prefill from profile provider if available
    Future.microtask(() async {
      final me = await ref.read(profileProvider.future);
      if (me != null) {
        _nameController.text = me.name ?? '';
        _emailController.text = me.email ?? '';
        _phoneController.text = me.phoneNumber ?? '';
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _loading = true);
    try {
      final me = await ref.read(profileProvider.future);
      if (me == null || me.id == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profil tidak tersedia')),
        );
        return;
      }

      final api = ref.read(apiProvider);
      final result = await api.updateProfile(
        id: me.id!.toString(),
        email: _emailController.text.trim(),
        name: _nameController.text.trim(),
        phone_number: _phoneController.text.trim(),
      );

      if (result != null) {
        // invalidate profileProvider to refresh data
        ref.invalidate(profileProvider);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result.message ?? 'Berhasil diperbarui')),
        );
        Navigator.of(context).pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal memperbarui profil')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: $e')),
      );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const PageTitle(
                          title: 'Update Profil',
                          withBackButton: true,
                        ),
                        StaticWidget.hMediumPadding,

                        // Avatar / illustration (Lottie)
                        Center(
                          child: Lottie.asset('assets/json/user.json',
                              width: Dimensions.giganticSize,
                              height: Dimensions.giganticSize),
                        ),
                        StaticWidget.hLargePadding,

                        // Form fields
                        _LabeledField(
                            label: 'Nama',
                            child: TextFormField(
                              controller: _nameController,
                              validator: (v) => v == null || v.isEmpty ? 'Nama wajib diisi' : null,
                            )),
                        StaticWidget.hSmallPadding,
                        _LabeledField(
                            label: 'Email',
                            child: TextFormField(
                              controller: _emailController,
                              validator: (v) => v == null || v.isEmpty ? 'Email wajib diisi' : null,
                            )),
                        StaticWidget.hSmallPadding,
                        _LabeledField(
                            label: 'Telepon',
                            child: TextFormField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                            )),
                        StaticWidget.hLargePadding,

                        // Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _loading ? null : () => Navigator.of(context).pop(),
                                child: const Text('Batal'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _loading ? null : _onSave,
                                child: _loading
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(strokeWidth: 2),
                                      )
                                    : const Text('Simpan'),
                              ),
                            ),
                          ],
                        ),
                        StaticWidget.hLargePadding,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  final String label;
  final Widget child;
  const _LabeledField({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
  Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Material(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: child,
          ),
        ),
      ],
    );
  }
}
