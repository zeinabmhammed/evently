import 'package:evently/core/resources/common_widgets/app_shared_preferences.dart';
import 'package:evently/core/resources/theme/app_themes.dart';
import 'package:evently/features/add_event/presentation/screens/add_event_screen.dart';
import 'package:evently/features/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:evently/features/auth/presentation/screens/login/login_screen.dart';
import 'package:evently/features/auth/presentation/screens/register/register_screen.dart';
import 'package:evently/features/main_layout/main_layout.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/providers/auth_provider.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/main_layout/map/widgets/map_event.dart';
import 'features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'features/splash/presentation/screens/splash_screen.dart';
import 'core/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppSharedPreferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<LanguageProvider>(
          create: (_) => LanguageProvider(),
        ),
        ChangeNotifierProvider<AppAuthProvider>(
          create: (_) => AppAuthProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ThemeProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final authProvider = context.watch<AppAuthProvider>();

    return MaterialApp(
      title: 'Evently App',
      debugShowCheckedModeBanner: false,

      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: provider.getSelectedThemeMode(),

      routes: {
        AppRoutes.SplashScreen.route: (context) => SplashScreen(),
        AppRoutes.OnBoardingScreen.route: (context) => OnBoardingScreen(),
        AppRoutes.LoginScreen.route: (context) => LoginScreen(),
        AppRoutes.RegisterScreen.route: (context) => RegisterScreen(),
        AppRoutes.ForgetPasswordScreen.route: (context) =>
            ForgetPasswordScreen(),
        AppRoutes.MainLayout.route: (context) => MainLayout(),
        AppRoutes.AddEventScreen.route: (context) => AddEventScreen(),
        AppRoutes.MapEvent.route: (context) => MapEvent(),
      },

      initialRoute: authProvider.isLoggedInBefore()
          ? AppRoutes.MainLayout.route
          : AppRoutes.OnBoardingScreen.route,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.getSelectedLocale(),
    );
  }
}
