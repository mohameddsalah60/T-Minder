import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icon_notifications.dart';

class WarningProductWidget extends StatelessWidget {
  const WarningProductWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'Days Left',
              style: TextStyle(
                fontSize: 17.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '0',
              style: TextStyle(
                fontSize: 19.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Expaire Date',
              style: TextStyle(
                fontSize: 17.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8.r,
            ),
            Text(
              '0.0.0000',
              style: TextStyle(
                fontSize: 19.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const IconNotifications(),
      ],
    );
  }
}
