import 'package:evently/core/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'on_boarding_data.dart';

class PageViewItemWidget extends StatelessWidget {
  final OnBoardingData data;

  const PageViewItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(data.imagePath),
        SizedBox(height: 28,),
        Text(
          data.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.lightPrimary,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 39),
          Text(
            data.description,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.start,
          ),
      ],
    );
  }
}
