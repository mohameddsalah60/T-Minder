import 'package:flutter/material.dart';

import '../helper_functions/colors_for_days.dart';
import '../utils/app_text_styles.dart';

class ZoneProductWidget extends StatelessWidget {
  const ZoneProductWidget({
    super.key,
    required this.text,
    required this.daysLeft,
  });

  final String text;
  final int daysLeft;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 6,
        left: 8,
        right: 8,
      ),
      decoration: BoxDecoration(
        color: colorsForDays(daysLeft: daysLeft),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyles.bold13.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
