import 'package:evently/core/resources/app_assets/app_assets.dart';
import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:evently/features/auth/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/on_boarding_data.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/page_view_item_widget.dart';
import 'on_boarding_screen.dart';

class OnBoardingPagesScreen extends StatefulWidget {
  const OnBoardingPagesScreen({super.key});

  @override
  State<OnBoardingPagesScreen> createState() => _OnBoardingPagesScreenState();
}

class _OnBoardingPagesScreenState extends State<OnBoardingPagesScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.onBoardingLogo,
              width: 159,
              height: 50,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0,top: 28,),
        child: Column(
          children: [
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: OnBoardingData.getOnBoardingList(context).length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return PageViewItemWidget(
                    data: OnBoardingData.getOnBoardingList(context)[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button
                IconButton(
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                    else {
                      Navigator.pop(context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingScreen(),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.arrow_circle_left_outlined,
                      color: AppColors.lightPrimary, size: 37,
                  ),
                ),

                // Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    OnBoardingData.getOnBoardingList(context).length,
                        (index) => DotIndicator(isActive: index == _currentPage),
                  ),
                ),

                // Next button
                IconButton(
                  onPressed: () {
                    if (_currentPage <
                        OnBoardingData.getOnBoardingList(context).length -1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                    else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    }
                  },
                  icon: const Icon(Icons.arrow_circle_right_outlined,
                      color: AppColors.lightPrimary,
                  size: 37,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}