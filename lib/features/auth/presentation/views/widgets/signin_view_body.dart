import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_images.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_password_field.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/social_signin_button.dart';

class SigninViewBody extends StatelessWidget {
  const SigninViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const CustomTextFromField(hintText: 'البريد الالكتروني'),
          const SizedBox(
            height: 16,
          ),
          CustomPasswordField(
            onSaved: (password) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'نسيت كلمة المرور؟',
                style: TextStyles.semiBold13.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 37,
          ),
          const CustomButton(text: 'تسجيل الدخول'),
          const SizedBox(
            height: 33,
          ),
          const DonthHaveAnAccountWidget(),
          const SizedBox(
            height: 33,
          ),
          const OrDivider(),
          const SizedBox(
            height: 16,
          ),
          const SocialSignInButton(
            text: 'تسجيل بواسطة جوجل',
            img: Assets.assetsImagesGoogleIcon,
          ),
          const SizedBox(
            height: 16,
          ),
          const SocialSignInButton(
            text: 'تسجيل بواسطة فيسبوك',
            img: Assets.assetsImagesFacebookIcon,
          ),
        ],
      ),
    );
  }
}
