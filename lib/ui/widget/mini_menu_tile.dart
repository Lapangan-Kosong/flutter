import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MiniMenuTile extends ConsumerWidget {
  const MiniMenuTile({
    super.key,
    required this.menu,
    required this.size,
  });

  final AppsMenu menu;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final color = null;

    return Material(
      borderRadius: Dimensions.commonCircularCorner,
      child: SizedBox(
        width: size,
        height: size,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Dimensions.commonCircularCorner,
            // border: Border.all(
            //   color: colorScheme.primary,
            // ),
          ),
          child: ClipRRect(
            borderRadius: Dimensions.commonCircularCorner,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.all(size / 3),
                    child: menu.image ?? StaticWidget.empty,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    color: colorScheme.onPrimary.withAlpha(200),
                    padding: const EdgeInsets.all(Dimensions.smallSize),
                    child: Text(
                      menu.title,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      // borderRadius: Dimensions.commonCircularCorner,
                      onTap: () => menu.go(
                        context,
                        ref,
                      ),
                    ),
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
