import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

Color colorsForDays({required int daysLeft}) {
  if (daysLeft <= 30) {
    return Colors.red;
  } else if (daysLeft <= 60) {
    return AppColors.primaryColor;
  } else {
    return Colors.green;
  }
}
