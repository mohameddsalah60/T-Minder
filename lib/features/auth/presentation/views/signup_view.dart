import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'تسجيل حساب جديد',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        body: const SafeArea(child: SignUpViewBodyBlocConsumer()),
      ),
    );
  }
}
