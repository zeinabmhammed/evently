import 'package:evently/core/resources/app_assets.dart';
import 'package:evently/core/resources/app_colors.dart';
import 'package:evently/extensions/context_extension.dart';
import 'package:evently/ui/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppAuthProvider>();
    final user = provider.getUser();

    return Row(

      children: [
        Container(
          width: 124,
          height: 124,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(AppAssets.profileTab),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(1000),
              bottomRight: Radius.circular(1000),
              bottomLeft: Radius.circular(1000),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                user?.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.fonts.bodyLarge?.copyWith(
                  color: AppColors.backgroundColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                user?.email ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.fonts.bodyLarge?.copyWith(
                  color: AppColors.backgroundColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
