import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/common/app_shared_preferences.dart';
import 'package:evently/ui/design/design.dart';
import 'package:evently/routes.dart';
import 'package:evently/ui/providers/language_provider.dart';
import 'package:evently/ui/providers/theme_provider.dart';
import 'package:evently/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LanguageProvider>(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);

    return MaterialApp(
      title: 'Evently App',
      debugShowCheckedModeBanner: false,

      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: provider.getSelectedThemeMode(),

      routes: {AppRoutes.SplashScreen.route: (context) => const SplashScreen()},

      initialRoute: AppRoutes.SplashScreen.route,
      localizationsDelegates: AppLocalizations.localizationsDelegates,

      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.getSelectedLocale(),
    );
  }
}
