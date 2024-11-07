import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/repos/notifications_repo.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';
import 'package:tmart_expiry_date/features/notifications/presentation/notifications_cubit/notifications_cubit.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = 'notification-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'الاشعارات',
        onTap: Navigator.of(context).pop,
      ),
      body: BlocProvider(
        create: (context) =>
            NotificationsCubit(getIt<NotificationsRepo>())..getNotifications(),
        child: SafeArea(
          child: BlocBuilder<NotificationsCubit, NotificationsState>(
            builder: (context, state) {
              if (state is NotificationsSuccsess) {
                return NotificationViewBody(
                  notificationsEntity: state.notifications,
                );
              } else if (state is NotificationsFailure) {
                return Center(child: Text(state.message));
              } else if (state is NotificationsLoading) {
                return Column(
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
                );
              } else {
                return Text(
                  'لا يوجد اشعارات حاليا',
                  style: TextStyles.regular16,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
