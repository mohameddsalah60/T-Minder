import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class DonthHaveAnAccountWidget extends StatelessWidget {
  const DonthHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟  ',
          style: TextStyles.semiBold16.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Navigator.of(context).pushNamed(SignUpView.routeName);
          },
          child: Text(
            'قم بإنشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
