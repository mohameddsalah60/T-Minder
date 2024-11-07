import 'package:flutter/material.dart';

import 'notification_header.dart';
import 'notifications_list.dart';

class NewNotifications extends StatelessWidget {
  const NewNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 16,
        ),
        NotificationHeader(
          count: "3",
          title: 'جديد',
        ),
        SizedBox(
          height: 16,
        ),
        NotificationsList(),
      ],
    );
  }
}
