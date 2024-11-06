import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';

import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/select_zone_cubit/select_zone_cubit.dart';

import 'widgets/select_zone_body_bloc_consumer.dart';

class SelectZoneView extends StatelessWidget {
  const SelectZoneView({super.key});
  static const routeName = 'selectZoneView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectZoneCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        body: SafeArea(child: SelectZoneBlocConsumer()),
      ),
    );
  }
}
