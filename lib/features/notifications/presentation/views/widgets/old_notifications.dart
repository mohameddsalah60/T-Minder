import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/notifications/presentation/views/widgets/notifications_list.dart';

import '../../../domin/entites/notifications_entity.dart';
import 'notification_header.dart';

class OldNotifications extends StatelessWidget {
  const OldNotifications({super.key, required this.notificationsEntity});
  final List<NotificationsEntity> notificationsEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationHeader(
          count: notificationsEntity.length.toString(),
          title: 'في وقت سابق',
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
