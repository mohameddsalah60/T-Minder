import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_password_field.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/terms_and_condition_widget.dart';

import 'have_an_account_widget.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const CustomTextFromField(hintText: 'الاسم كامل'),
            const SizedBox(
              height: 16,
            ),
            const CustomTextFromField(hintText: 'البريد الإلكتروني'),
            const SizedBox(
              height: 16,
            ),
            CustomPasswordField(
              onSaved: (password) {},
            ),
            const SizedBox(
              height: 24,
            ),
            TermsAndConditionWidget(
              value: false,
              onChanged: (p0) {},
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomButton(text: 'إنشاء حساب جديد'),
            const SizedBox(
              height: 26,
            ),
            const HaveAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
