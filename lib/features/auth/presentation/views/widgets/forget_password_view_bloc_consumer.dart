import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_loading_indector.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/forget_password_cubit/forget_password_cubit.dart';

import 'forget_password_view_body.dart';

class ForgetPasswordViewBlocConsumer extends StatelessWidget {
  const ForgetPasswordViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordFailure) {
          customDialogAlert(
            context: context,
            text: state.message,
          );
        } else {
          customDialogAlert(
            context: context,
            text: 'تم ارسال رمز التحقق للبريد الالكتروني',
          );
        }
      },
      builder: (context, state) {
        return CustomLoadingIndector(
            isLoading: state is ForgetPasswordLoading ? true : false,
            child: const ForgetPasswordViewBody());
      },
    );
  }
}
