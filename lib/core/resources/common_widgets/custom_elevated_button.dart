import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final bool hasIcon;
  final Widget? iconWidget;
  final Widget? childIconWidget;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = AppColors.lightPrimary,
    this.borderColor = Colors.transparent,
    this.textStyle,
    this.hasIcon = false,
    this.iconWidget,
    this.childIconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: borderColor!, width: 2),
        ),
      ),
      child: hasIcon
          ? childIconWidget!
          : Text(
              text,
              style:
                  textStyle ??
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.backgroundColor,
                  ),
            ),
    );
  }
}
