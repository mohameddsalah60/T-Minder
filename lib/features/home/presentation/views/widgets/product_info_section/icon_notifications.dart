import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_snack_bar.dart';

class IconNotifications extends StatefulWidget {
  const IconNotifications({
    super.key,
  });

  @override
  State<IconNotifications> createState() => _IconNotificationsState();
}

class _IconNotificationsState extends State<IconNotifications> {
  bool unActive = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          unActive = !unActive;
          if (unActive) {
            customShowSnackBar(
              context,
              text: 'تم تفعيل الاشعارات لهذا المنتج',
              color: AppColors.greenColor,
            );
          } else {
            customShowSnackBar(
              context,
              text: 'تم الغاء تفعيل الاشعارات لهذا المنتج',
            );
          }
        });
      },
      icon: unActive
          ? const Icon(
              Icons.notifications_active,
              color: AppColors.greenColor,
              size: 38,
            )
          : const Icon(
              Icons.notifications_off_sharp,
              color: Colors.red,
              size: 38,
            ),
    );
  }
}
