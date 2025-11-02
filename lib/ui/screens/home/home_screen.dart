import 'package:evently/extensions/context_extension.dart';
import 'package:evently/routes.dart';
import 'package:evently/ui/design/design.dart';
import 'package:evently/ui/providers/auth_provider.dart';
import 'package:evently/ui/common/custom_tab_bar.dart';
import 'package:evently/ui/screens/home/tabs/favorites/favorite_tab.dart';
import 'package:evently/ui/screens/home/tabs/home_tabs/home_tab.dart';
import 'package:evently/ui/screens/home/tabs/map/map_tab.dart';
import 'package:evently/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int currentBottomNavIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    MapTab(),
    MapTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    AppAuthProvider provider = Provider.of<AppAuthProvider>(context);
    var user = provider.getUser();

    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          toolbarHeight: 140,
          backgroundColor: context.appColors.primary,
          actions: [
            IconButton(
              onPressed: () {
                provider.logout();
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.LoginScreen.route,
                );
              },
              icon: Icon(
                Icons.logout_outlined,
                color: AppColors.backgroundColor,
              ),
            ),
          ],
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (user?.name?.isEmpty == false) ...[
                Text(
                  "Welcome Back ✨",
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
                SizedBox(height: 8.00),
                Row(
                  children: [
                    SvgPicture.asset(AppImages.mapIcon, width: 24, height: 24),
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomTabBar(
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
        body: tabs[currentBottomNavIndex]  ,
        bottomNavigationBar: BottomNavigationBar(
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
                icon: SvgPicture.asset(AppImages.homeIcon),
                label: "Home",
                activeIcon: SvgPicture.asset(AppImages.homeFill),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.mapIcon),
                label: "Map",
                activeIcon: SvgPicture.asset(AppImages.mapFill),
              ),BottomNavigationBarItem(
                icon: SizedBox(),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.heartIcon),
                label: "Favorites",
                activeIcon: SvgPicture.asset(AppImages.heartFill),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.profileIcon),
                label: "Profile",
                activeIcon: SvgPicture.asset(AppImages.profileFill),
              ),
            ] ,
        ) ,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(75),
            side: BorderSide(color: AppColors.backgroundColor,
              width: 5,
            )
          ),
            onPressed: (){},
          child: Icon(Icons.add,size:24),

          
        ),
      ),
    );
  }
}
