import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'build_border.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.readOnly = false,
    this.suffixIcon,
  });
  final String hintText;
  final void Function(String)? onChanged;

  final bool readOnly;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .65,
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: TextInputType.number,
        readOnly: readOnly,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: const Color(0xffF9FAFA),
          hintText: hintText,
          hintStyle: TextStyle(
            color: const Color(0xff949D9E),
            fontSize: 14.sp,
          ),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
          border: buildBorder(),
        ),
      ),
    );
  }
}
