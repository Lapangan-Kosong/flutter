import 'dart:math';

import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

CommonMessage buildCommonMessage(
  dynamic error,
  StackTrace trace, {
  String? title,
  VoidCallback? onTap,
}) =>
    CommonMessage(
      title: title ?? 'Terjadi Kesalahan',
      error: error,
      onTap: onTap,
    );

class CommonMessage extends ConsumerWidget {
  const CommonMessage({
    super.key,
    required this.title,
    this.subtitle,
    this.onTap,
    this.headerImage,
    this.borderRadius,
    this.trailing,
    this.error,
    this.padding,
    this.showError = kDebugMode,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? headerImage;
  final BorderRadius? borderRadius;
  final Widget? trailing;
  final dynamic error;
  final EdgeInsets? padding;
  final bool showError;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return InkWell(
      borderRadius: borderRadius,
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.mediumSize),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (headerImage != null) headerImage!,
                    if (headerImage != null) StaticWidget.vSmallPadding,
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor,
                        ),
                      ),
                    if (error != null && showError) Text(error.toString()),
                  ],
                ),
              ),
              if (trailing != null) trailing!
            ],
          ),
        ),
      ),
    );
  }
}
