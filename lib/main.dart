import 'package:abs/ui/controller/navigation/routes.dart';
import 'package:abs/ui/pages/splash_page.dart';
import 'package:abs/ui/pages/unknown_page.dart';
import 'package:abs/ui/provider/provider.dart';
import 'package:abs/utils/preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart' as date_local;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  await date_local.initializeDateFormatting('ID_id');

  runApp(
    ProviderScope(
      overrides: [
        prefsProvider.overrideWithValue(
          Preferences(prefs: sharedPreferences),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ref.watch(themeProvider),
      home: SplashPage(),
      debugShowCheckedModeBanner: kDebugMode,
      onGenerateRoute: (settings) => Routes.getMaterialPageRoutes(settings),
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (ctx) => const UnknownPage(),
      ),
    );
  }
}
