import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    super.key,
    required this.count,
    required this.title,
  });
  final String count, title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.bold16,
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xffEBF9F1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            count,
            style: TextStyles.bold14.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
