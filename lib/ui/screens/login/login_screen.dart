import 'package:evently/core/resources/app_assets.dart';
import 'package:evently/core/resources/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/routes.dart';
import 'package:evently/ui/common/custom_form_Field.dart';
import 'package:evently/ui/common/language_switcher.dart';
import 'package:evently/ui/common/validators.dart';
import 'package:evently/ui/providers/auth_provider.dart';
import 'package:evently/ui/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
 const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.login,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.OnBoardingScreen.route);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.lightPrimary,
            size: 24,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.asset(AppAssets.splashLogo, width: 163, height: 186),
          ),
          SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomFormField(
                  label: AppLocalizations.of(context)!.email,
                  prefixIcon: SvgPicture.asset(AppAssets.emailIcon),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return AppLocalizations.of(context)!.please_enter_email;
                    }
                    if (!isValidEmail(text)) {
                      return AppLocalizations.of(context)!.please_enter_valid_email;
                    }
                  },
                ),
                CustomFormField(
                  label: AppLocalizations.of(context)!.password,
                  controller: passwordController,
                  prefixIcon: SvgPicture.asset(AppAssets.passwordIcon),
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return AppLocalizations.of(context)!.please_enter_your_password;
                    }
                    if ((text?.length ?? 0) < 6) {
                      return AppLocalizations.of(context)!.password_must_be_at_least_6_characters;
                    }
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.ForgetPasswordScreen.route,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    AppLocalizations.of(context)!.forget_password,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.lightPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      login();
                    },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: isLoading
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          AppLocalizations.of(context)!.logging_in,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.grey),
                        ),
                      ],
                    )
                  : Text(
                      AppLocalizations.of(context)!.login,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.don_t_have_account,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RegisterScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.create_account,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.lightPrimary,
                    endIndent: 15,
                  ),
                ),
                Text(AppLocalizations.of(context)!.or
                    , style: TextStyle(color: AppColors.lightPrimary)),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.lightPrimary,
                    indent: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ElevatedButton.icon(
              onPressed: () async {
                try {
                  final userCredential = await signInWithGoogle();
                  print(
                    "Login successful: ${userCredential.user?.displayName}",
                  );
                } catch (e) {
                  print("Error during login: $e");
                }
              },
              icon: Image.asset('assets/images/google.png', height: 25),
              label: Text(
                isLoading ? AppLocalizations.of(context)!.logging_in : AppLocalizations.of(context)!.login_with_google,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightPrimary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.lightPrimary),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

          Center(child: LanguageSwitcher()),
        ],
      ),
    );
  }

  void login() async {
    if (validateForm() == false) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    AppAuthProvider provider = Provider.of<AppAuthProvider>(
      context,
      listen: false,
    );
    AuthResponse response = await provider.login(
      emailController.text,
      passwordController.text,
    );
    if (response.success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.logged_in_successfully)));
      Navigator.pushReplacementNamed(context, AppRoutes.HomeScreen.route);
    } else {
      handleAuthError(response);
    }
    setState(() {
      isLoading = false;
    });
  }

  bool? validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void handleAuthError(AuthResponse response) {
    String errorMessage;
    switch (response.failure) {
      case AuthFailure.invalidCredential:
        errorMessage = AppLocalizations.of(context)!.wrong_email_or_password;
        break;
      default:
        errorMessage = AppLocalizations.of(context)!.something_went_wrong;
        break;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
