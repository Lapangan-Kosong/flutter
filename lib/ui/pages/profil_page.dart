import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:abs/models/login/me.dart';
import 'package:abs/ui/pages/navbar.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/ui/widget/common_message.dart';
import 'package:abs/ui/widget/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class ProfilPage extends ConsumerWidget {
  const ProfilPage({
    super.key,
    this.user,
    this.ids,
  });

  final Me? user;
  final String? ids;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    // Set tabActive to dashboard when on profile page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tabActiveProvider.notifier).state =
          AppsMenuId.profile.toString();
    });

    final user = ref.watch(profileProvider);

    debugPrint(user.toString());

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      PageTitle(
                        title: "Profil User",
                        withBackButton: false,
                      ),
                      user.when(
                          data: (me) => me != null
                              ? _PegawaiPage(user: me)
                              : Text("Pegawai Not Found"),
                          error: (e, t) => buildCommonMessage(
                                e,
                                t,
                                onTap: () => ref.invalidate(profileProvider),
                              ),
                          loading: () =>
                              const Center(child: CircularProgressIndicator()))
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PegawaiPage extends ConsumerWidget {
  const _PegawaiPage({required this.user});

  final Me user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    debugPrint(user.createdAt);

    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: Dimensions.commonCircularCorner,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.smallSize),
            child: Column(
              children: [
                StaticWidget.hSmallPadding,
                Lottie.asset('assets/json/user.json',
                    width: Dimensions.giganticSize,
                    height: Dimensions.giganticSize),
                StaticWidget.hMediumPadding,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            user.name ?? '',
                            style: textTheme.titleLarge,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            user.email ?? '-',
                            style: textTheme.titleSmall
                                ?.copyWith(fontWeight: FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
