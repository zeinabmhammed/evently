import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'event_tab.dart';

class CustomEventTabBar extends StatelessWidget {
  final Map<EventTab, TabInfo> tabsMap;
  final EventTab selectedTab;
  final Function(EventTab) onTabChanged;
  final bool showAll;
  final bool isInverse;
  const CustomEventTabBar({
    super.key,
    required this.tabsMap,
    required this.selectedTab,
    required this.onTabChanged,
    this.showAll = true,
    this.isInverse = false,
  });
  @override
  Widget build(BuildContext context) {
    final entries = tabsMap.entries
        .where((e) => showAll || e.key != EventTab.all)
        .toList();
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: entries.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final entry = entries[index];
          final isSelected = selectedTab == entry.key;
          Color bgColor;
          Color contentColor;
          BorderSide border;
          if (isSelected) {
            bgColor = isInverse ? Colors.white : AppColors.lightPrimary;
            contentColor = isInverse ? AppColors.lightPrimary : Colors.white;
            border = BorderSide.none;
          } else {
            bgColor = Colors.transparent;
            contentColor = isInverse
                ? AppColors.backgroundColor
                : AppColors.lightPrimary;
            border = BorderSide(
              color: isInverse ? Colors.white : AppColors.lightPrimary,
              width: 1.5,
            );
          }
          return InkWell(
            onTap: () => onTabChanged(entry.key),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(25),
                border: Border.fromBorderSide(border),
              ),
              child: Row(
                children: [
                  Icon(entry.value.icon, size: 24, color: contentColor),
                  const SizedBox(width: 8),
                  Text(
                    entry.value.name,
                    style: TextStyle(
                      color: contentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
