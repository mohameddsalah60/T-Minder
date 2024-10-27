import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tmart_expiry_date/core/utils/app_images.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: const Color(0XFFEEF8ED).withOpacity(
              color == Colors.white ? .2 : 1,
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
