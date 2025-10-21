import 'package:evently/ui/design/design.dart';
import 'package:flutter/material.dart';


class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive ? AppColors.lightPrimary : AppColors.black,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
