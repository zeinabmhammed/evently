import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final Widget prefix;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CustomSearchField({
    super.key,
    required this.hintText,
    required this.prefix,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.lightPrimary,
        style: TextStyle(
          color: AppColors.lightPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.lightPrimary),
          prefixIcon: Padding(padding: const EdgeInsets.all(12), child: prefix),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.lightPrimary, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColors.lightPrimary, width: 2),
          ),
        ),
      ),
    );
  }
}
