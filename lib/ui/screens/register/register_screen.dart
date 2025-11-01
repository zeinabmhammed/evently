import 'package:evently/routes.dart';
import 'package:evently/ui/common/custom_form_Field.dart';
import 'package:evently/ui/common/language_switcher.dart';
import 'package:evently/ui/common/validators.dart';
import 'package:evently/ui/design/design.dart';
import 'package:evently/ui/providers/auth_provider.dart';
import 'package:evently/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
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

  bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
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
          SizedBox(height:10),
          Center(
            child: Image.asset(AppImages.splashLogo, width: 163, height: 186),
          ),
          SizedBox(height: 10),
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomFormField(
                  label: "Name",
                  prefixIcon: Icons.person,
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
                CustomFormField(
                  label: "Email",
                  prefixIcon: Icons.email_rounded,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return "Please Enter Email";
                    }
                    if (!isValidEmail(text)) {
                      return "Please Enter Valid Email";
                    }
                  },
                ),
                CustomFormField(
                  label: "Password",
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return "Please Enter Your Password";
                    }
                    if ((text?.length ?? 0) < 6) {
                      return "Password must be at least 6 characters";
                    }
                  },
                ),
                CustomFormField(
                  label: "Re Password",
                  controller: rePasswordController,
                  prefixIcon: Icons.lock,
                  keyboardType: TextInputType.text,
                  isPassword: true,
                  validator: (text) {
                    if (text?.trim().isEmpty == true) {
                      return "Please Enter Your Password";
                    }
                    if (passwordController.text != rePasswordController.text) {
                      return "Password doesn't match";
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
              onPressed: isLoading? null: () {
                createAccount();
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: isLoading? Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    "Creating Account",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.grey,
                    )
                  ),
                ],
              )
                  : Text(
                "Create Account",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already Have Account ?",
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
                  "Login",
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
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context, listen: false);
    AuthResponse response = await provider.register(
      emailController.text,
      passwordController.text,
      nameController.text,
    );
    if (response.success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("User Registered Successfully")));
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.HomeScreen.route,
      );
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
        errorMessage = "Wrong Email Or Password";
        break;
      default:
        errorMessage = "Something went wrong";
        break;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
