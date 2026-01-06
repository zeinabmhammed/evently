import 'package:evently/core/resources/app_assets/app_assets.dart';
import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/features/add_event/presentation/screens/add_event_screen.dart';
import 'package:evently/features/main_layout/favorites/presentation/screen/favorite_tab.dart';
import 'package:evently/features/main_layout/home_tabs/presentation/screens/home_tab.dart';
import 'package:evently/features/main_layout/map/presentation/screens/map_tab.dart';
import 'package:evently/features/main_layout/profile/presentation/screens/profile_tab.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  int currentBottomNavIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    MapTab(),
    AddEventScreen(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        body: tabs[currentBottomNavIndex],
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: Theme.of(
              context,
            ).bottomNavigationBarTheme.backgroundColor,
            currentIndex: currentBottomNavIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.backgroundColor,
            unselectedItemColor: AppColors.backgroundColor,
            onTap: (index) {
              setState(() {
                currentBottomNavIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.homeIcon),
                label: AppLocalizations.of(context)!.home,
                activeIcon: SvgPicture.asset(AppAssets.homeFill),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.mapIcon),
                label: AppLocalizations.of(context)!.map,
                activeIcon: SvgPicture.asset(AppAssets.mapFill),
              ),
              BottomNavigationBarItem(icon: SizedBox(), label: ""),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.heartIcon),
                label: AppLocalizations.of(context)!.favorites,
                activeIcon: SvgPicture.asset(AppAssets.heartFill),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.profileIcon),
                label: AppLocalizations.of(context)!.profile,
                activeIcon: SvgPicture.asset(AppAssets.profileFill),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEventScreen()),
            );
          },
          child: Icon(Icons.add, color: AppColors.backgroundColor, size: 30),
        ),
      ),
    );
  }
}
