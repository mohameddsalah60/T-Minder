import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/repos/notifications_repo.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:tmart_expiry_date/core/widgets/custom_app_bar.dart';
import 'package:tmart_expiry_date/features/notifications/presentation/notifications_cubit/notifications_cubit.dart';

import 'widgets/notification_view_bloc_builder.dart';

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
        child: const SafeArea(
          child: NotificationViewBlocBuilder(),
        ),
      ),
    );
  }
}
