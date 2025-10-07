import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/ui/widget/backdrop.dart';
import 'package:abs/ui/widget/logo.dart';
import 'package:abs/ui/widget/page_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final prefs = ref.watch(prefsProvider);
    final themeController = ref.watch(themeProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              PageTitle(
                menu: Menus.settings,
              ),
              _SettingItem(
                onTap: () => ref.read(themeProvider.notifier).toggleDarkness(),
                label: themeController?.brightness == Brightness.dark
                    ? 'Mode terang'
                    : 'Mode gelap',
                icon: themeController?.brightness == Brightness.dark
                    ? Icons.light_mode
                    : Icons.dark_mode_rounded,
              ),
              _SettingItem(
                onTap: () => ref.read(userProvider.notifier).logout(context),
                label: 'Logout',
                icon: Icons.logout_rounded,
              ),
              _Config(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Config extends ConsumerWidget {
  const _Config();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final config = ref.watch(configProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimensions.mediumSize),
          child: Text(
            'Client Config',
            style: textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.mediumSize,
            vertical: Dimensions.tinySize,
          ),
          child: Row(
            children: [
              Container(
                width: Dimensions.largeSize - Dimensions.smallSize,
                height: Dimensions.largeSize - Dimensions.smallSize,
                decoration: BoxDecoration(
                  color: config.primaryColor,
                  borderRadius: Dimensions.commonCircularCorner,
                ),
              ),
              StaticWidget.hMediumPadding,
              Expanded(
                  child: Text(
                'Primary Color',
                style: textTheme.titleSmall,
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.mediumSize,
            vertical: Dimensions.tinySize,
          ),
          child: Row(
            children: [
              Container(
                width: Dimensions.largeSize - Dimensions.smallSize,
                height: Dimensions.largeSize - Dimensions.smallSize,
                decoration: BoxDecoration(
                  color: config.secondaryColor,
                  borderRadius: Dimensions.commonCircularCorner,
                ),
              ),
              StaticWidget.hMediumPadding,
              Expanded(
                  child: Text(
                'Secondary Color',
                style: textTheme.titleSmall,
              ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.mediumSize,
            vertical: Dimensions.smallSize,
          ),
          child: Row(
            children: [
              StaticWidget.hMinisculePadding,
              Text(
                '@',
                style: textTheme.headlineSmall,
              ),
              StaticWidget.hMediumPadding,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Base url'),
                    Text(
                      config.baseUrl,
                      style: textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.mediumSize,
            vertical: Dimensions.smallSize,
          ),
          child: Row(
            children: [
              Logo(
                size: Dimensions.largeSize - Dimensions.smallSize,
              ),
              StaticWidget.hMediumPadding,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Logo'),
                    Text(
                      config.logo ?? '',
                      style: textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.mediumSize,
            vertical: Dimensions.smallSize,
          ),
          child: Row(
            children: [
              SizedBox(
                width: Dimensions.largeSize - Dimensions.smallSize,
                height: Dimensions.largeSize - Dimensions.smallSize,
                child: FittedBox(
                  child: Backdrop(
                      // size: Dimensions.largeSize - Dimensions.smallSize,
                      ),
                ),
              ),
              StaticWidget.hMediumPadding,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Backdrop'),
                    Text(
                      config.background ?? '-',
                      style: textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingItem extends ConsumerWidget {
  const _SettingItem({
    required this.onTap,
    required this.label,
    this.icon,
  });

  final VoidCallback onTap;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.mediumSize,
          vertical: Dimensions.smallSize,
        ),
        child: Row(
          children: [
            Icon(icon),
            StaticWidget.hMediumPadding,
            Expanded(
              child: Text(
                label,
                style: textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
