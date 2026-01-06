import 'package:evently/core/resources/app_assets/app_assets.dart';
import 'package:evently/core/resources/common_widgets/custom_search_field.dart';
import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/features/main_layout/home_tabs/presentation/widgets/event_card.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomSearchField(
            hintText: AppLocalizations.of(context)!.search_for_event,
            prefix: SvgPicture.asset(
              AppAssets.searchIcon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.lightPrimary,
                BlendMode.srcIn,
              ),
            ),
            onChanged: (value) {
              // search logic
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8,
                bottom: 16,
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => EventCard(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
