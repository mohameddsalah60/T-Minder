import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/features/profile/domin/repos/profile_repo.dart';
import 'package:tmart_expiry_date/features/profile/presentation/cubits/logout_user_cubit/logout_user_cubit.dart';

import 'logout_button_bloc_consumer.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutUserCubit(getIt<ProfileRepo>()),
      child: const LogoutButtonBlocConsumer(),
    );
  }
}
