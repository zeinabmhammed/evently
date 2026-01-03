import 'package:evently/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DateOrTimeWidget extends StatelessWidget {
  final String iconName;
  final String eventDateOrTimeName;
  final VoidCallback onChooseTimeOrDate;
  final String chooseTimeOrDate;

  const DateOrTimeWidget({
    super.key,
    required this.iconName,
    required this.eventDateOrTimeName,
    required this.onChooseTimeOrDate,
    required this.chooseTimeOrDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconName, color: Theme.of(context).iconTheme.color),
        const SizedBox(width: 8),
        Text(
          eventDateOrTimeName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Spacer(),
        TextButton(
          onPressed: onChooseTimeOrDate,
          child: Text(chooseTimeOrDate,
          style: GoogleFonts.inter(
            color: AppColors.lightPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          ),
        ),
      ],
    );
  }
}
