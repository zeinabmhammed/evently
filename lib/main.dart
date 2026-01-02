import 'package:evently/core/resources/app_themes.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/common/app_shared_preferences.dart';
import 'package:evently/routes.dart';
import 'package:evently/ui/providers/auth_provider.dart';
import 'package:evently/ui/providers/language_provider.dart';
import 'package:evently/ui/providers/theme_provider.dart';
import 'package:evently/ui/screens/add_event/add_event_screen.dart';
import 'package:evently/ui/screens/add_event/map/map_event.dart';
import 'package:evently/ui/screens/home/home_screen.dart';
import 'package:evently/ui/screens/login/login_screen.dart';
import 'package:evently/ui/screens/on_boarding/on_boarding_screen.dart';
import 'package:evently/ui/screens/forget_password/forget_password_screen.dart';
import 'package:evently/ui/screens/register/register_screen.dart';
import 'package:evently/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    AppAuthProvider authProvider = Provider.of<AppAuthProvider>(context);

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
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.AddEventScreen.route: (context) => AddEventScreen(),
        AppRoutes.MapEvent.route:(context)=>MapEvent()
      },

      initialRoute: authProvider.isLoggedInBefore()
          ? AppRoutes.HomeScreen.route
          : AppRoutes.OnBoardingScreen.route,

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageProvider.getSelectedLocale(),
    );
  }
}
