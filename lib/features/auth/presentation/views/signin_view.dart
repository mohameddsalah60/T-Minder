import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';

import 'widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول'),
      body: const SafeArea(child: SigninViewBody()),
    );
  }
}
