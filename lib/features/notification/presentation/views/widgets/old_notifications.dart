import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/notification/presentation/views/widgets/notifications_list.dart';

import 'notification_header.dart';

class OldNotifications extends StatelessWidget {
  const OldNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NotificationHeader(
          count: "15",
          title: 'في وقت سابق',
        ),
        SizedBox(
          height: 16,
        ),
        NotificationsList(),
      ],
    );
  }
}
