import 'package:abs/constant/dimension.dart';
import 'package:abs/constant/static_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugWidget extends ConsumerWidget {
  const DebugWidget({
    super.key,
    required this.map,
  });

  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return kDebugMode
        ? Container(
            decoration: BoxDecoration(
              borderRadius: Dimensions.commonCircularCorner,
              border: Border.all(color: theme.highlightColor),
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: Dimensions.smallSize,
              vertical: Dimensions.smallSize,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimensions.smallSize),
                  child: Text(
                    'Debug Window',
                    style: textTheme.titleSmall,
                  ),
                ),
                ...map.entries.map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.smallSize,
                        vertical: Dimensions.tinySize),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.key.toString(),
                          style: textTheme.bodySmall,
                        ),
                        Text(
                          item.value.toString(),
                          style: textTheme.titleSmall?.copyWith(
                            fontStyle:
                                item.value == null ? FontStyle.italic : null,
                            fontWeight: item.value == null
                                ? FontWeight.normal
                                : FontWeight.bold,
                            color:
                                item.value == null ? theme.disabledColor : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : StaticWidget.empty;
  }
}
