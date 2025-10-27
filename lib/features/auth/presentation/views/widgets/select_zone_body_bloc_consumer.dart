import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/features/auth/presentation/cubits/select_zone_cubit/select_zone_cubit.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/widgets/select_zone_view_body.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/main_view.dart';

class SelectZoneBlocConsumer extends StatelessWidget {
  const SelectZoneBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectZoneCubit, SelectZoneState>(
      listener: (context, state) {
        if (state is SelectZoneFailure) {
          customDialogAlert(
            context: context,
            text: state.message,
          );
        } else if (state is SelectZoneSuccses) {
          Navigator.of(context).pushReplacementNamed(MainView.routeName);
        }
      },
      child: const SelectZoneViewBody(),
    );
  }
}
