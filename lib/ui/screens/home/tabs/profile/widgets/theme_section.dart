import 'package:evently/core/resources/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../providers/theme_provider.dart';

class ThemeSection extends StatelessWidget {
  const ThemeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.theme,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 14),
        DropdownButtonFormField<ThemeMode>(
          value: themeProvider.getSelectedThemeMode(),
          decoration: _dropdownDecoration(),
          icon: _dropdownIcon(),
          items: [
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(
                AppLocalizations.of(context)!.light,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(
                AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              themeProvider.changeTheme(value);
            }
          },
        ),
      ],
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightPrimary, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.lightPrimary, width: 2),
      ),
    );
  }

  Icon _dropdownIcon() {
    return const Icon(
      Icons.arrow_drop_down_rounded,
      color: AppColors.lightPrimary,
      size: 35,
    );
  }
}
