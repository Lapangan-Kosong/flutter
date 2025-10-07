import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:abs/ui/controller/navigation/menus.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabActive = ref.watch(tabActiveProvider);

    // final user = ref.watch(userProvider);

    // if (user == null) {
    //   Menus.login.go(context, ref);
    // }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.favorite,
            isActive: tabActive == AppsMenuId.dashboard.toString(),
            onTap: () {
              Menus.dashboard.go(context, ref);
            },
          ),
          // _NavBarItem(
          //   icon: Icons.grid_view,
          //   isActive: true,
          //   onTap: () {},
          // ),
          _NavBarItem(
            icon: Icons.person,
            isActive: tabActive == AppsMenuId.profile.toString(),
            onTap: () {
              Menus.profile.go(context, ref);
            },
          ),
          // _NavBarItem(
          //   icon: Icons.more_horiz,
          //   isActive: false,
          //   onTap: () {},
          // ),
          _NavBarItem(
            icon: Icons.logout,
            isActive: tabActive == AppsMenuId.dashboard.toString(),
            onTap: () => ref.read(userProvider.notifier).logout(context),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends ConsumerWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: isActive ? const Color(0xFF1E3A5F) : Colors.grey,
          size: 28,
        ),
      ),
    );
  }
}
