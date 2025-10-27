import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_loading_indector.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/select_zone_view.dart';

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
            text: state.error,
          );
        } else if (state is SignupSuccses) {
          Navigator.pushReplacementNamed(context, SelectZoneView.routeName);
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
