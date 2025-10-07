import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dimensions {
  static const inconsistencyDistanceInMeter = 1000;
  static const dldkDistanceInMeter = 100;
  static const nearbyPoiRadius = 100;
  static const minDldkOutHour = 0;

  static const minisculeSize = 2.0;
  static const tinySize = 4.0;
  static const smallSize = 8.0;
  static const mediumSize = 16.0;
  static const largeSize = 32.0;
  static const hugeSize = 64.0;
  static const giganticSize = 128.0;

  static const minimumPresensiDistanceInMeters = 1000;
  static const sliverHeaderPercentage = 5;
  static const commonCorner = 8.0;
  static const borderWidth = 1.0;
  static const shadowOpacity = 100;
  static const subtleShadowOpacity = 10;
  static const dropShadowRadius = 2.0;

  static const commonAvatarRadius = 20.0;
  static const commonAvatarBorder = 1.0;

  // add bottom sheet
  static const titlePadding = EdgeInsets.all(smallSize);
  static const horizontalContentPadding = EdgeInsets.symmetric(
    horizontal: smallSize,
  );
  static const verticalContentPadding = EdgeInsets.symmetric(
    vertical: smallSize,
  );
  static const contentPadding = EdgeInsets.all(smallSize);

  static const presensiIconSize = 16.0;

  static const goldenRatio = 1.618;

  static const commonRadius = Radius.circular(commonCorner);
  static const commonCircularCorner = BorderRadius.all(commonRadius);

  static const indonesia = LatLng(-6.200000, 106.816666);
}
