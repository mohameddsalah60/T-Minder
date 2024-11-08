import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/products_cubit/products_cubit.dart';
import 'package:tmart_expiry_date/features/notifications/domin/entites/notifications_entity.dart';
import 'package:tmart_expiry_date/features/notifications/presentation/notifications_cubit/notifications_cubit.dart';

import 'new_notifications.dart';
import 'old_notifications.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key, required this.notificationsEntity});
  final List<NotificationsEntity> notificationsEntity;
  @override
  Widget build(BuildContext context) {
    // context.read<NotificationsCubit>().save();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                NewNotifications(
                  notificationsEntity: notificationsEntity,
                ),
                const SizedBox(
                  height: 16,
                ),
                OldNotifications(
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
