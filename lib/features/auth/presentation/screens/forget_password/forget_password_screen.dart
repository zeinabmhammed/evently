import 'package:evently/core/resources/app_assets/app_assets.dart';
import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../register/register_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forget Password",
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterScreen(),

                )  );
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
          Image.asset(AppAssets.forgetPassword,
            width: 361,
            height: 361,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:24),
            child: ElevatedButton(
              onPressed: () {
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child:
              Text(
                "Reset Password",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
