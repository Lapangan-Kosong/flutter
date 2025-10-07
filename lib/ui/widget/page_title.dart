import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:abs/models/abs_menu.dart';
import 'package:abs/ui/widget/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageTitle extends ConsumerWidget {
  const PageTitle({
    super.key,
    this.menu,
    this.title,
    this.color,
    this.textColor,
    this.withBackButton = true,
    this.withLogo = false,
    this.actions = const <Widget>[],
  });

  final AppsMenu? menu;
  final String? title;
  final bool withBackButton;
  final bool withLogo;
  final List<Widget> actions;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final useTitle = menu?.title ?? title;
    final onSurfaceColor = color == null ? null : colorScheme.onPrimary;

    return Container(
      color: color,
      child: Row(
        children: [
          withBackButton
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_rounded),
                  color: textColor ?? onSurfaceColor,
                )
              : StaticWidget.hMediumPadding,
          if (withLogo) Logo(),
          if (withLogo) StaticWidget.hSmallPadding,
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: Dimensions.mediumSize),
              child: Text(
                useTitle ?? '',
                style: textTheme.titleLarge?.copyWith(
                  color: textColor ?? onSurfaceColor,
                ),
              ),
            ),
          ),
          ...actions
        ],
      ),
    );
  }
}
