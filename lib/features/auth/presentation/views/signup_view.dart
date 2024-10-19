import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'تسجيل حساب جديد',
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      body: const SafeArea(
        child: SignupViewBody(),
      ),
    );
  }
}
