import 'package:flutter/material.dart';

import '../../../domin/entites/notifications_entity.dart';
import 'custom_notification_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key, required this.notificationsEntity});
  final List<NotificationsEntity> notificationsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        notificationsEntity.length,
        (index) {
          return CustomNotificationItem(
            notificationsEntity: notificationsEntity[index],
          );
        },
      ),
    );
  }
}
