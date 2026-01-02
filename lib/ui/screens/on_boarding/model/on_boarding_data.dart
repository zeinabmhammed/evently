import 'package:evently/core/resources/app_assets.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class OnBoardingData {
  String imagePath;
  String title;
  String description;

  OnBoardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });

  static List<OnBoardingData> getOnBoardingList(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return [
      OnBoardingData(
        imagePath: AppAssets.secondOnBoarding,
        title: loc.screen_one_title,
        description: loc.screen_one_subtitle,
      ),
      OnBoardingData(
        imagePath: AppAssets.thirdOnBoarding,
        title: loc.screen_two_title,
        description: loc.screen_two_subtitle,
      ),
      OnBoardingData(
        imagePath: AppAssets.fourthOnBoarding,
        title: loc.screen_three_title,
        description: loc.screen_three_subtitle,
      ),
    ];
  }
}