import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:evently/ui/design/design.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  const CustomTabBar({required this.selectedIndex, this.onTap, super.key});

  Widget buildTab(String text, IconData icon, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.backgroundColor : Colors.transparent,
        border: Border.all(color: AppColors.backgroundColor, width: 1),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isActive
                ? AppColors.lightPrimary
                : AppColors.backgroundColor,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isActive
                  ? AppColors.lightPrimary
                  : AppColors.backgroundColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.all(10),
      child: TabBar(
        onTap: (index) {
          // notify parent to update selected index
          if (onTap != null) onTap!(index);
        },
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(horizontal: 6),
        tabs: [
          buildTab("All", FontAwesome.compass, selectedIndex == 0),
          buildTab("Sport", FontAwesome.bicycle_solid, selectedIndex == 1),
          buildTab(
            "Birthday",
            FontAwesome.cake_candles_solid,
            selectedIndex == 2,
          ),
          buildTab("Meeting", FontAwesome.handshake, selectedIndex == 3),
          buildTab("Gaming", FontAwesome.playstation_brand, selectedIndex == 4),
          buildTab("Eating", FontAwesome.utensils_solid, selectedIndex == 5),
          buildTab(
            "Holiday",
            FontAwesome.umbrella_beach_solid,
            selectedIndex == 6,
          ),
          buildTab(
            "Exhibition",
            FontAwesome.landmark_dome_solid,
            selectedIndex == 7,
          ),
          buildTab("Work Shop", Icons.work_outline_rounded, selectedIndex == 8),
          buildTab(
            "Book Club",
            FontAwesome.book_open_reader_solid,
            selectedIndex == 9,
          ),
        ],
      ),
    );
  }
}
