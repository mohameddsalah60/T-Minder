import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_loading_indector.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

import 'signup_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupFailure) {
          customDialogAlert(
            context: context,
            title: 'خطأ',
            text: state.error,
            type: "error",
          );
        } else if (state is SignupSuccses) {
          customDialogAlert(
            context: context,
            title: 'Succses',
            text: 'تم انشاء حساب جديد بنجاح',
            type: "success",
          );
        }
      },
      builder: (context, state) {
        return CustomLoadingIndector(
            isLoading: state is SignupLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }
}
