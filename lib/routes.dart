enum AppRoutes{
  SplashScreen ("splash_screen"),
  OnBoardingScreen  ("onBoarding"),
  RegisterScreen  ("register"),
  LoginScreen  ("login"),
  ForgetPasswordScreen  ("forget_password"),
  HomeScreen  ("home"),

  ;

  final String route;

  const AppRoutes (this.route);
}