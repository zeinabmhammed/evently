import 'package:evently/features/main_layout/profile/presentation/widgets/language_section.dart';
import 'package:evently/features/main_layout/profile/presentation/widgets/logout_button.dart';
import 'package:evently/features/main_layout/profile/presentation/widgets/profile_app_bar.dart';
import 'package:evently/features/main_layout/profile/presentation/widgets/theme_section.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            LanguageSection(),
            SizedBox(height: 16),
            ThemeSection(),
            Spacer(),
            LogoutButton(),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}