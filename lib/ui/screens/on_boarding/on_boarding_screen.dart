import 'package:evently/common/language_switcher.dart';
import 'package:evently/core/resources/app_assets.dart';
import 'package:evently/core/resources/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/screens/on_boarding/on_boarding_pages_screen.dart';
import 'package:flutter/material.dart';
import '../../../common/theme_switcher.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(AppAssets.onBoardingLogo,
              width: 159,
              height: 50,
            ),
          ]
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0,top: 28,),
        child: Column(
          children: [
            Image.asset(AppAssets.firstOnBoarding),
         SizedBox(height: 28),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.of(context)!.onboarding_screen_title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightPrimary),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height:24),
                  Text(AppLocalizations.of(context)!.onboarding_screen_subtitle,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                    ),
                  SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.language ,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.lightPrimary,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      LanguageSwitcher(),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.theme ,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.lightPrimary,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      ThemeSwitcher(),
                    ],
                  ),
                  SizedBox(height: 28,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const OnBoardingPagesScreen(),
                        ),
                      );
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child:
                    Text(AppLocalizations.of(context)!.lets_start,
                      style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),

                ],
              ),
             ),
           ],
        ),
      ),
    );
  }
}
