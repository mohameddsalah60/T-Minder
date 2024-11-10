import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/notifications/domin/entites/notifications_entity.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({
    super.key,
    required this.notificationsEntity,
  });
  final NotificationsEntity notificationsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: notificationsEntity.isSeen == false
              ? Colors.grey.shade300
              : Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: const Icon(Icons.notifications),
        title: Text(
          notificationsEntity.body,
          style: TextStyles.semiBold13,
          maxLines: 2,
        ),
        trailing: Text(
          notificationsEntity.time,
          style: TextStyles.regular13.copyWith(color: const Color(0xff949D9E)),
        ),
      ),
    );
  }
}
