import 'package:evently/core/resources/app_assets/app_assets.dart';
import 'package:evently/core/resources/common_widgets/custom_form_Field.dart';
import 'package:evently/core/resources/common_widgets/language_switcher.dart';
import 'package:evently/core/resources/common_widgets/validators.dart';
import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/core/routes/app_routes.dart';
import 'package:evently/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.register,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
          SizedBox(height: 10),
          Center(
            child: Image.asset(AppAssets.splashLogo, width: 163, height: 186),
          ),
          SizedBox(height: 10),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomFormField(
                  label: AppLocalizations.of(context)!.name,
                  prefixIcon: SvgPicture.asset(AppAssets.nameIcon),
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return AppLocalizations.of(context)!.please_enter_name;
                    }
                    return null;
                  },
                ),
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
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_valid_email;
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
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_your_password;
                    }
                    if ((text?.length ?? 0) < 6) {
                      return AppLocalizations.of(
                        context,
                      )!.password_must_be_at_least_6_characters;
                    }
                  },
                ),
                CustomFormField(
                  label: AppLocalizations.of(context)!.re_password,
                  controller: rePasswordController,
                  prefixIcon: SvgPicture.asset(AppAssets.passwordIcon),
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return AppLocalizations.of(
                        context,
                      )!.please_enter_your_password;
                    }
                    if (passwordController.text != rePasswordController.text) {
                      return AppLocalizations.of(context)!.does_not_match;
                    }
                  },
                ),
              ],
            ),
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
                      createAccount();
                    },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: isLoading
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          AppLocalizations.of(context)!.creating_account,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.grey),
                        ),
                      ],
                    )
                  : Text(
                      AppLocalizations.of(context)!.create_account,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.have_account,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.LoginScreen.route,
                  );
                },
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
              ),
            ],
          ),
          Center(child: LanguageSwitcher()),
        ],
      ),
    );
  }

  void createAccount() async {
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
    AuthResponse response = await provider.register(
      emailController.text,
      passwordController.text,
      nameController.text,
    );
    if (response.success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.user_registered_successfully)));
      Navigator.pushReplacementNamed(context, AppRoutes.MainLayout.route);
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
