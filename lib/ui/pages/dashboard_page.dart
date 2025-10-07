import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/abs_menu.dart';
import 'navbar.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

final _lastRefreshProvider = StateProvider<DateTime?>((ref) => null);

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final lastRefresh = ref.watch(_lastRefreshProvider);

    // Set tabActive to dashboard when on profile page
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tabActiveProvider.notifier).state =
          AppsMenuId.dashboard.toString();
    });

    final user = ref.watch(userProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              _Profile(),
              const SizedBox(height: 40),
              Text(
                'Choose your sport today ${user?.name}!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E3A5F),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _SportCard(
                      title: 'BADMINTON',
                      icon: Icons.sports_tennis,
                      onTap: () {},
                    ),
                    _SportCard(
                      title: 'PADEL',
                      icon: Icons.sports_tennis,
                      onTap: () {},
                    ),
                    _SportCard(
                      title: 'BASKET',
                      icon: Icons.sports_basketball,
                      onTap: () {},
                    ),
                    _SportCard(
                      title: 'SWIM',
                      icon: Icons.pool,
                      onTap: () {},
                    ),
                    _SportCard(
                      title: 'RUN',
                      icon: Icons.directions_run,
                      onTap: () {},
                    ),
                    _SportCard(
                      title: 'TENNIS',
                      icon: Icons.sports_tennis,
                      onTap: () {},
                    ),
                    _SportCard(
                      title: 'BOXING',
                      icon: Icons.sports_mma,
                      onTap: () {},
                    ),
                    _SportCard(
                      title: 'YOGA',
                      icon: Icons.self_improvement,
                      onTap: () {},
                    ),
                  ],
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

class _Profile extends ConsumerWidget {
  const _Profile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final user = ref.watch(userProvider);
    debugPrint('User Provider: $user');
    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: Dimensions.commonCircularCorner,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(Dimensions.smallSize),
            child: Row(
              children: [
                StaticWidget.hSmallPadding,
                Lottie.asset('assets/json/user.json',
                    width: Dimensions.giganticSize,
                    height: Dimensions.giganticSize),
                StaticWidget.hMediumPadding,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user?.name ?? '',
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        user?.email ?? '-',
                        style: textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SportCard extends ConsumerWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _SportCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E3A5F),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: Colors.white,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
