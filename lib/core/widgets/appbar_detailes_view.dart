import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarDetailesView extends StatelessWidget {
  const AppBarDetailesView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (scroll) {
        if (scroll.delta.dy > 0) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          Navigator.pop(context);
        }
      },
      child: Container(
        height: 5.h,
        width: 80.w,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
