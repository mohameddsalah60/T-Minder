import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

customShowSnackBar(BuildContext context,
    {required String text, Color color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
