import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_no_found_data_widget.dart';
import '../../notifications_cubit/notifications_cubit.dart';
import 'notification_view_body.dart';

class NotificationViewBlocBuilder extends StatelessWidget {
  const NotificationViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsSuccsess) {
          return NotificationViewBody(
            notificationsEntity: state.notifications,
          );
        } else if (state is NoFoundNotifications) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomNoFoundDataWidget(
                data: "لا يوجد اشعارات في الوقت الحالي",
              ),
            ],
          );
        } else if (state is NotificationsFailure) {
          return Center(child: Text(state.message));
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'جاري التحميل',
                    style: TextStyles.regular16,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
