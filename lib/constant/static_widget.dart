import 'package:abs/constant/dimension.dart';
import 'package:flutter/material.dart';

class StaticWidget {
  static const vMinisculePadding = SizedBox(height: Dimensions.minisculeSize);
  static const vTinyPadding = SizedBox(height: Dimensions.tinySize);
  static const vSmallPadding = SizedBox(height: Dimensions.smallSize);
  static const vMediumPadding = SizedBox(height: Dimensions.mediumSize);
  static const vLargePadding = SizedBox(height: Dimensions.largeSize);
  static const vHugePadding = SizedBox(height: Dimensions.hugeSize);
  static const vGiganticPadding = SizedBox(height: Dimensions.giganticSize);

  static const hMinisculePadding = SizedBox(width: Dimensions.minisculeSize);
  static const hTinyPadding = SizedBox(width: Dimensions.tinySize);
  static const hSmallPadding = SizedBox(width: Dimensions.smallSize);
  static const hMediumPadding = SizedBox(width: Dimensions.mediumSize);
  static const hLargePadding = SizedBox(width: Dimensions.largeSize);
  static const hHugePadding = SizedBox(width: Dimensions.hugeSize);
  static const hGiganticPadding = SizedBox(width: Dimensions.giganticSize);

  static const empty = SizedBox.shrink();
  static const loading = ClipRRect(
    borderRadius: Dimensions.commonCircularCorner,
    child: LinearProgressIndicator(),
  );
  static const divider = Divider(height: 1);
  static const expanded = Expanded(child: StaticWidget.empty);
}
