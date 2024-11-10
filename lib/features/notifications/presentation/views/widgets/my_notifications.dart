import 'package:flutter/material.dart';

import '../../../domin/entites/notifications_entity.dart';
import 'notification_header.dart';
import 'notifications_list.dart';

class MyNotifications extends StatelessWidget {
  const MyNotifications({super.key, required this.notificationsEntity});
  final List<NotificationsEntity> notificationsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        NotificationHeader(
          count: notificationsEntity.length.toString(),
          title: 'اشعاراتك',
        ),
        const SizedBox(
          height: 16,
        ),
        NotificationsList(
          notificationsEntity: notificationsEntity,
        ),
      ],
    );
  }
}
