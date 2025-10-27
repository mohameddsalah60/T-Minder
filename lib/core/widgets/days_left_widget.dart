import 'package:flutter/material.dart';

import '../helper_functions/colors_for_days.dart';
import '../utils/app_text_styles.dart';

class DaysLeftWidget extends StatelessWidget {
  const DaysLeftWidget({
    super.key,
    required this.daysLeft,
  });

  final int daysLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: colorsForDays(daysLeft: daysLeft),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          '$daysLeft عدد ايام متبقية',
          style: TextStyles.bold16,
        ),
      ],
    );
  }
}
