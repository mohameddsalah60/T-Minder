import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        'T-mart Expiry Date',
        style: TextStyle(
          fontSize: 20.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        '${getWeekDays(DateTime.now().weekday)} - ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.settings,
          size: 24.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  String getWeekDays(int day) {
    List<String> weekDays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    return weekDays[day];
  }
}
