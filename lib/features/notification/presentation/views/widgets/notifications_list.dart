import 'package:flutter/material.dart';

import 'custom_notification_item.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        3,
        (index) {
          return const CustomNotificationItem();
        },
      ),
    );
  }
}
