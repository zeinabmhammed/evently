import 'package:evently/core/resources/app_assets/app_assets.dart';
import 'package:evently/core/resources/common_widgets/custom_event_tab_bar.dart';
import 'package:evently/core/resources/common_widgets/event_tab.dart';
import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/extensions/context_extension.dart';
import 'package:evently/features/main_layout/home_tabs/presentation/widgets/event_card.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../../../../../providers/auth_provider.dart';
import '../../../../../../../providers/language_provider.dart';
import '../../../../../../../providers/theme_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  EventTab selectedCategory = EventTab.all;

  @override
  Widget build(BuildContext context) {
    final tabs = getEventTabs(context);
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);
    var user = provider.getUser();

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
        ),
        toolbarHeight: 140,
        backgroundColor: context.appColors.primary,
        centerTitle: false,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (user?.name?.isEmpty == false) ...[
                  Text(
                    AppLocalizations.of(context)!.welcome_back,
                    style: context.fonts.titleSmall?.copyWith(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    user?.name ?? "",
                    style: context.fonts.bodyLarge?.copyWith(
                      color: AppColors.backgroundColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppAssets.mapIcon,
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Cairo , Egypt",
                        style: context.fonts.bodyLarge?.copyWith(
                          color: AppColors.backgroundColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ] else
                  CircularProgressIndicator(),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                final themeProvider = context.read<ThemeProvider>();

                themeProvider.changeTheme(
                  themeProvider.getSelectedThemeMode() == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark,
                );
              },
              child:
                  context.watch<ThemeProvider>().getSelectedThemeMode() ==
                      ThemeMode.dark
                  ? Icon(EvaIcons.moon)
                  : SvgPicture.asset(AppAssets.themeIcon),
            ),
            SizedBox(width: 8),
            InkWell(
              onTap: () {
                final langProvider = context.read<LanguageProvider>();

                langProvider.changeLocale(
                  langProvider.getSelectedLocale().languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en'),
                );
              },
              child: Container(
                width: 35,
                height: 35,
                padding: const EdgeInsets.symmetric(
                  vertical: 6.5,
                  horizontal: 9.5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    context
                        .watch<LanguageProvider>()
                        .getSelectedLocale()
                        .languageCode
                        .toUpperCase(),
                    style: const TextStyle(
                      color: AppColors.lightPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
       bottom: PreferredSize(
         preferredSize: Size.fromHeight(50),
         child: Padding(
           padding: const EdgeInsets.only(bottom: 15,top: 5),
           child: CustomEventTabBar(
             tabsMap: tabs,
             selectedTab: selectedCategory,
             showAll: true,
             isInverse: true,
             onTabChanged: (newTab) {
               setState(() {
                 selectedCategory = newTab;
               });
             },
           ),
         ),
       ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (context, index) => EventCard(),
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemCount: 10,
        ),
      ),
    );
  }
}
