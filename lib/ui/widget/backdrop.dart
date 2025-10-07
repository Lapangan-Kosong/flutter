import 'package:abs/constant/static_widget.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/client_config.dart';
import '../../constant/dimension.dart';

class Backdrop extends ConsumerWidget {
  const Backdrop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final config = ref.watch(configProvider);

    return StaticWidget.empty;
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.hugeSize * 2),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Opacity(
          opacity: 0.2,
          child: Image.asset(config.background ?? '', width: width),
        ),
      ),
    );
  }
}
