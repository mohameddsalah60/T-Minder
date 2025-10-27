import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_loading_indector.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/select_zone_view.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/main_view.dart';

import 'signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninFailure) {
          customDialogAlert(
            context: context,
            text: state.error,
          );
        } else if (state is SigninSuccses) {
          if (context.mounted) {
            // تحقق من أن الـ widget لا يزال موجودًا
            if (getUser().zone == '') {
              Navigator.pushReplacementNamed(context, SelectZoneView.routeName);
            } else {
              Navigator.pushReplacementNamed(context, MainView.routeName);
            }
          }
        }
      },
      builder: (context, state) {
        return CustomLoadingIndector(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
