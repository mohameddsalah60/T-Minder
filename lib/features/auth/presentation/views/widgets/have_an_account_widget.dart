import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل؟  ',
          style: TextStyles.semiBold14.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'تسجيل دخول',
            style: TextStyles.semiBold14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
