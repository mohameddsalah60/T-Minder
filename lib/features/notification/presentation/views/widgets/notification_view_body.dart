import 'package:flutter/material.dart';

import 'new_notifications.dart';
import 'old_notifications.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                NewNotifications(),
                SizedBox(
                  height: 16,
                ),
                OldNotifications(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
