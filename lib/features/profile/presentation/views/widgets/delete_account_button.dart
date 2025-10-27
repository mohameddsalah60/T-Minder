import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/features/profile/domin/repos/profile_repo.dart';
import 'package:tmart_expiry_date/features/profile/presentation/cubits/delete_user_cubit/delete_user_cubit.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/widgets/custom_dialog_alert.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import 'custom_profile_item.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteUserCubit(getIt<ProfileRepo>()),
      child: const DeleteAccountButtonBlocConsumer(),
    );
  }
}

class DeleteAccountButtonBlocConsumer extends StatelessWidget {
  const DeleteAccountButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) {
        if (state is DeleteUserFailure) {
          customDialogAlert(context: context, text: state.message);
        } else if (state is DeleteUserSuccses) {
          if (context.mounted) {
            Navigator.pushReplacementNamed(context, SigninView.routeName);
            customDialogAlert(
              context: context,
              text: 'تم حذف حسابك بنجاح',
            );
          }
        }
      },
      builder: (context, state) {
        return CustomProfileItem(
          onTap: () {
            context.read<DeleteUserCubit>().deleteAccount();
          },
          title: 'حذف الحساب',
          assetName: Assets.assetsImagesUserDelete,
          color: Colors.red,
        );
      },
    );
  }
}
