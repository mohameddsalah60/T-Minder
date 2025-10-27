import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tmart_expiry_date/core/utils/app_images.dart';
import 'package:tmart_expiry_date/features/notifications/presentation/views/notification_view.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(NotificationView.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0XFFEEF8ED).withOpacity(
              color == Colors.white ? .2 : 0,
            ),
            borderRadius: BorderRadiusDirectional.circular(16)),
        child: color == Colors.white
            ? SvgPicture.asset(Assets.assetsImagesNotification)
            : const Icon(
                Icons.notifications_none_sharp,
              ),
      ),
    );
  }
}
