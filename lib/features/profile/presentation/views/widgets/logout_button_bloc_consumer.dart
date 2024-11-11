import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_dialog_alert.dart';
import '../../../../../core/widgets/custom_loading_indector.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import '../../cubits/logout_user_cubit/logout_user_cubit.dart';

class LogoutButtonBlocConsumer extends StatelessWidget {
  const LogoutButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutUserCubit, LogoutUserState>(
      listener: (context, state) {
        if (state is LogoutUserFailure) {
          customDialogAlert(context: context, text: state.message);
        } else if (state is LogoutUserSuccses) {
          if (context.mounted) {
            Navigator.pushReplacementNamed(context, SigninView.routeName);
          }
        }
      },
      builder: (context, state) => CustomLoadingIndector(
        isLoading: state is LogoutUserLoading ? true : false,
        child: ListTile(
          onTap: () {
            context.read<LogoutUserCubit>().logoutAccount();
          },
          contentPadding: const EdgeInsets.all(0),
          title: Center(
            child: Text(
              'تسجيل الخروج',
              style: TextStyles.semiBold14.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          trailing: const Padding(
            padding: EdgeInsets.only(left: 48),
            child: Icon(
              Icons.logout,
              color: AppColors.primaryColor,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
