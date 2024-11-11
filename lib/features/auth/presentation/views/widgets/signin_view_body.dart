import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_images.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_password_field.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/forget_password_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/social_signin_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: SingleChildScrollView(
        child: Form(
          key: fromKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFromField(
                hintText: 'البريد الالكتروني',
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ForgetPasswordView.routeName);
                  },
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
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    context.read<SigninCubit>().signinUserWithEmailAndPassword(
                          email,
                          password,
                        );
                  }
                },
              ),
              const SizedBox(
                height: 33,
              ),
              const DonthHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 24,
              ),
              SocialSignInButton(
                text: 'تسجيل بواسطة جوجل',
                img: Assets.assetsImagesGoogleIcon,
                onPressed: () {
                  context.read<SigninCubit>().signinUserWithGoogle();
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
