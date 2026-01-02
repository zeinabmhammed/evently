import 'package:evently/core/resources/app_colors.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomTabBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int>? onTap;

  const CustomTabBar({required this.selectedIndex, this.onTap, super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  Widget buildTab(String text, IconData icon, bool isActive) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color iconColor;
    Color textColor;

    if (isDark) {
      //  Dark mode
      iconColor = Colors.white;
      textColor = Colors.white;
    } else {
      //  Light mode
      if (isActive) {
        iconColor = AppColors.lightPrimary;
        textColor = AppColors.lightPrimary;
      } else {
        iconColor = Colors.white;
        textColor = Colors.white;
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).focusColor : Colors.transparent,
        border: Border.all(color: Theme.of(context).focusColor, width: 2),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: iconColor),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textColor,
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
          if (widget.onTap != null) widget.onTap!(index);
        },
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.symmetric(horizontal: 6),
        tabs: [
          buildTab(
            AppLocalizations.of(context)!.all,
            FontAwesome.compass,
            widget.selectedIndex == 0,
          ),
          buildTab(
            AppLocalizations.of(context)!.sport,
            FontAwesome.bicycle_solid,
            widget.selectedIndex == 1,
          ),
          buildTab(
            AppLocalizations.of(context)!.birthday,
            FontAwesome.cake_candles_solid,
            widget.selectedIndex == 2,
          ),
          buildTab(
            AppLocalizations.of(context)!.meeting,
            FontAwesome.handshake,
            widget.selectedIndex == 3,
          ),
          buildTab(
            AppLocalizations.of(context)!.gaming,
            FontAwesome.playstation_brand,
            widget.selectedIndex == 4,
          ),
          buildTab(
            AppLocalizations.of(context)!.eating,
            FontAwesome.utensils_solid,
            widget.selectedIndex == 5,
          ),
          buildTab(
            AppLocalizations.of(context)!.holiday,
            FontAwesome.umbrella_beach_solid,
            widget.selectedIndex == 6,
          ),
          buildTab(
            AppLocalizations.of(context)!.exhibition,
            FontAwesome.landmark_dome_solid,
            widget.selectedIndex == 7,
          ),
          buildTab(
            AppLocalizations.of(context)!.work_shop,
            Icons.work_outline_rounded,
            widget.selectedIndex == 8,
          ),
          buildTab(
            AppLocalizations.of(context)!.book_club,
            FontAwesome.book_open_reader_solid,
            widget.selectedIndex == 9,
          ),
        ],
      ),
    );
  }
}
