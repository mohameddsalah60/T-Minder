import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Color colorsForDays({required int daysLeft}) {
  if (daysLeft <= 14) {
    return Colors.red;
  } else if (daysLeft <= 30) {
    return AppColors.primaryColor;
  } else {
    return Colors.green;
  }
}
