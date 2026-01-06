import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<Locale>(
          value: languageProvider.getSelectedLocale(),
          decoration: _dropdownDecoration(),
          icon: _dropdownIcon(),
          items: languageProvider.getSupportedLocals().map((locale) {
            final label = locale.languageCode == 'en'
                ? AppLocalizations.of(context)!.english
                : AppLocalizations.of(context)!.arabic;
            return DropdownMenuItem(
              value: locale,
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.lightPrimary),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              languageProvider.changeLocale(value);
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
        borderSide: const BorderSide(
          color: AppColors.lightPrimary,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: AppColors.lightPrimary,
          width: 2,
        ),
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