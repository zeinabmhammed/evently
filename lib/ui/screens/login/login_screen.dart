import 'package:evently/routes.dart';
import 'package:evently/ui/common/custom_form_Field.dart';
import 'package:evently/ui/common/language_switcher.dart';
import 'package:evently/ui/common/validators.dart';
import 'package:evently/ui/design/design.dart';
import 'package:evently/ui/providers/auth_provider.dart';
import 'package:evently/ui/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
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
          SizedBox(height:20),
          Center(
            child: Image.asset(AppImages.splashLogo, width: 163, height: 186),
          ),
          SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: [
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
                    "Forget Password?",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.lightPrimary
                      ),

                                ),
                ),
    )],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: ElevatedButton(
              onPressed: isLoading? null: () {
               login();
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: isLoading? Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text(
                      "Logging in...",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.grey,
                    )
                  ),
                ],
              )
                  : Text(
                "Login",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t Have Account ?",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RegisterScreen(),
                    ),
                  );
                },
                child: Text(
                  "Create Account",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.lightPrimary,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: AppColors.lightPrimary,
                    endIndent: 15,
                  ),
                ),
                Text(
                  "Or",
                  style: TextStyle(color: AppColors.lightPrimary),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color:AppColors.lightPrimary,
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
                  print("Login successful: ${userCredential.user?.displayName}");
                } catch (e) {
                  print("Error during login: $e");
                }
              },
              icon: Image.asset(
                'assets/images/google.png',
                height: 25,
              ),
              label: Text(
                isLoading ? '...Logging in' : 'Login With Google',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightPrimary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.backgroundColor,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.lightPrimary),
                    borderRadius: BorderRadius.circular(16)
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
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context, listen: false);
    AuthResponse response = await provider.login(
      emailController.text,
      passwordController.text,
    );
    if (response.success) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Logged in Successfully")));
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
