import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Center(
        child: Text(
          'تسجيل الخروج',
          style: TextStyles.semiBold14.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
      trailing: const Padding(
        padding: EdgeInsets.only(left: 48),
        child: Icon(
          Icons.logout,
          color: AppColors.primaryColor,
          size: 26,
        ),
      ),
    );
  }
}
