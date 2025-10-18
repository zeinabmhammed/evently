import 'package:evently/ui/design/design.dart';
import 'package:evently/routes.dart';
import 'package:evently/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evently App',
      debugShowCheckedModeBanner: false,

      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,


      routes: {
        AppRoutes.SplashScreen.route: (context) => const SplashScreen()
      },

      initialRoute: AppRoutes.SplashScreen.route,
    );
  }
}
