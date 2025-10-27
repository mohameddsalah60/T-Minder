import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_password_field.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/terms_and_condition_widget.dart';

import 'have_an_account_widget.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password, phone;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: fromKey,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFromField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  phone = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFromField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
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
                height: 24,
              ),
              TermsAndConditionWidget(
                value: isSelected,
                onChanged: (value) {
                  setState(() {
                    isSelected = value!;
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'إنشاء حساب جديد',
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    if (isSelected) {
                      fromKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            name,
                            email,
                            password,
                            phone,
                          );
                    } else {
                      customDialogAlert(
                        context: context,
                        text: "يجب المواففة علي الشروط والاحكام",
                      );
                    }
                  }
                },
              ),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
