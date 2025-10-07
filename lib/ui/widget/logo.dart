import 'package:abs/constant/dimension.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/client_config.dart';

class Logo extends ConsumerWidget {
  const Logo({
    super.key,
    this.size = Dimensions.largeSize,
  });

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configProvider);
    return Hero(
      tag: 'header-logo',
      child: Image.asset(
        width: size,
        height: size,
        config.logo ?? '',
      ),
    );
  }
}
