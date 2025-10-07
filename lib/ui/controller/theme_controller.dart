import 'package:abs/constant/assets.dart';
import 'package:abs/models/client_config.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeId { classic, teal, red }

class ThemeController extends StateNotifier<ThemeData?> {
  final Ref _read;

  ThemeController(this._read) : super(null) {
    // init
    state = getTheme(_read.read(prefsProvider).useDarkness ?? false);
  }

  bool useDarkMode = false;

  // Color getPrimary(ThemeId themeId) {
  //   switch (themeId) {
  //     case ThemeId.teal:
  //       return const Color.fromARGB(255, 43, 97, 115);
  //     case ThemeId.red:
  //       return Colors.red;
  //     default:
  //       return Colors.blue;
  //   }
  // }

  // Color? getSecondary(ThemeId themeId) {
  //   switch (themeId) {
  //     case ThemeId.teal:
  //       return const Color.fromARGB(255, 232, 245, 105);
  //     default:
  //       return null;
  //   }
  // }

  String get fontHeadline => Assets.aFontProduct;

  String get fontTitle => Assets.aFontProduct;

  String get fontBody => Assets.aFontNeoSans;

  setDarkness(bool useDarkMode) async {
    // final prefs = await _read.read(prefsProvider.future);
    debugPrint('theme: setting theme to $useDarkMode');
    this.useDarkMode = useDarkMode;

    // prefs.setBool('is_using_dark_mode', useDarkMode);
    // prefs.isDarkMode = useDarkMode;
    state = getTheme(useDarkMode);
  }

  toggleDarkness() async {
    state = getTheme(!useDarkMode);
  }

  setTheme(ThemeId themeId) {
    state = getTheme(
      useDarkMode,
      themeId: themeId,
    );
  }

  ThemeData getTheme(
    bool useDarkMode, {
    ThemeId? themeId,
  }) {
    // identifier
    final brightness = useDarkMode ? Brightness.dark : Brightness.light;
    final config = _read.read(configProvider);

    // colorScheme
    final colorScheme = ColorScheme.fromSeed(
      // seedColor: getPrimary(themeId ?? ThemeId.classic),
      // primary: getPrimary(themeId ?? ThemeId.classic),
      // secondary: getSecondary(themeId ?? ThemeId.classic),
      seedColor: config.primaryColor,
      primary: config.primaryColor,
      secondary: config.secondaryColor,
      error: Colors.red,
      brightness: brightness,
    );

    // theme set
    final theme = ThemeData(
      useMaterial3: false,
      colorScheme: colorScheme,
    );

    // customize here
    final headlineLarge = theme.textTheme.headlineLarge?.copyWith(
      // fontWeight: FontWeight.bold,
      fontFamily: fontHeadline,
    );
    final headlineMedium = theme.textTheme.headlineMedium?.copyWith(
      // fontWeight: FontWeight.bold,
      fontFamily: fontHeadline,
    );
    final headlineSmall = theme.textTheme.headlineSmall?.copyWith(
      // fontWeight: FontWeight.bold,
      fontFamily: fontHeadline,
    );
    final titleLarge = theme.textTheme.titleLarge?.copyWith(
      fontFamily: fontTitle,
      fontWeight: FontWeight.bold,
    );
    final titleMedium = theme.textTheme.titleMedium?.copyWith(
      fontFamily: fontTitle,
      fontWeight: FontWeight.bold,
    );
    final titleSmall = theme.textTheme.titleSmall?.copyWith(
      fontFamily: fontTitle,
      fontWeight: FontWeight.bold,
    );
    final bodyLarge = theme.textTheme.bodyLarge?.copyWith(
      fontFamily: fontBody,
    );
    final bodyMedium = theme.textTheme.bodyMedium?.copyWith(
      fontFamily: fontBody,
    );
    final bodySmall = theme.textTheme.bodySmall?.copyWith(
      fontFamily: fontBody,
    );
    final labelLarge = theme.textTheme.labelLarge?.copyWith(
      fontFamily: fontBody,
    );
    final labelMedium = theme.textTheme.labelMedium?.copyWith(
      fontFamily: fontBody,
    );
    final labelSmall = theme.textTheme.labelSmall?.copyWith(
      fontFamily: fontBody,
    );

    final textTheme = theme.textTheme.copyWith(
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleMedium: titleMedium,
      titleLarge: titleLarge,
      titleSmall: titleSmall,
      bodyMedium: bodyMedium,
      bodyLarge: bodyLarge,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );

    // compose
    this.useDarkMode = useDarkMode;
    return theme.copyWith(
      scaffoldBackgroundColor:
          !useDarkMode ? const Color(0xFFFAFAFA) : const Color(0xFF424242),
      textTheme: textTheme,
    );
  }
}
