import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
