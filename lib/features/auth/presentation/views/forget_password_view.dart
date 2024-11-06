import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';

import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';
import 'widgets/forget_password_view_bloc_consumer.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const routeName = 'forgetPasswordView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'نسيان كلمة المرور',
          onTap: () => Navigator.of(context).pop(),
        ),
        body: const SafeArea(child: ForgetPasswordViewBlocConsumer()),
      ),
    );
  }
}
