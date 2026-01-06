import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/features/main_layout/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 156,
      backgroundColor: AppColors.lightPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(65),
        ),
      ),
      title: const ProfileHeader(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(156);
}
