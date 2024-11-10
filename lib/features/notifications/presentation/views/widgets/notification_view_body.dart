import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/notifications/domin/entites/notifications_entity.dart';

import 'my_notifications.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key, required this.notificationsEntity});
  final List<NotificationsEntity> notificationsEntity;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                MyNotifications(
                  notificationsEntity: notificationsEntity,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
