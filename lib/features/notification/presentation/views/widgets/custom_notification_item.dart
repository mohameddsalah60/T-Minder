import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CustomNotificationItem extends StatelessWidget {
  const CustomNotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const Icon(Icons.notifications),
      title: Text(
        'تبقي 30 يوم علي انتهاء المنتج : 5885555',
        style: TextStyles.semiBold13,
        maxLines: 2,
      ),
      trailing: Text(
        '9 صباحا',
        style: TextStyles.regular13.copyWith(color: const Color(0xff949D9E)),
      ),
    );
  }
}
