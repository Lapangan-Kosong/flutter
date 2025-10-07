import 'package:abs/constant/dimension.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Illustration {
  static const double menuSize = 100;
  static const double strokeWidth = 2;
  static const double fontSize = 34;

  // RASTER

  static final activity = Image.asset(
    'assets/images/menu/activity.png',
    fit: BoxFit.contain,
  );
  static final presensi = Image.asset(
    'assets/images/menu/presensi.png',
    fit: BoxFit.contain,
  );
  static final profile = Image.asset(
    'assets/images/menu/profile.png',
    fit: BoxFit.contain,
  );
  static final employees = Image.asset(
    'assets/images/menu/employees.png',
    fit: BoxFit.contain,
  );
  static final datang = Image.asset(
    'assets/images/datang.png',
    fit: BoxFit.contain,
  );
  static final pulang = Image.asset(
    'assets/images/pulang.png',
    fit: BoxFit.contain,
  );

  static final registrasi = Lottie.asset('/assets/json/profile.json');
}
