import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  late String email;
  final GlobalKey<FormState> fromlKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: fromlKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              'لا تقلق ، ما عليك سوى كتابة البريد الالكتروني وسنرسل رمز التحقق.',
              style: TextStyles.semiBold14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextFromField(
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                email = value!;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              text: 'نسيان كلمة المرور',
              onPressed: () {
                if (fromlKey.currentState!.validate()) {
                  fromlKey.currentState!.save();
                  context.read<ForgetPasswordCubit>().sendPasswordResetEmail(
                        email: email,
                      );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
