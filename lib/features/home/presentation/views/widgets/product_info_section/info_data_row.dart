import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';

class InfoDataRow extends StatelessWidget {
  const InfoDataRow({
    super.key,
    required this.textLabel,
    required this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.readOnly = false,
  });
  final String textLabel;
  final String hintText;
  final bool readOnly;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .18,
          child: Text(
            textLabel,
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: 16.r,
        ),
        CustomTextField(
          hintText: hintText,
          onChanged: onChanged,
          suffixIcon: suffixIcon,
          readOnly: readOnly,
        ),
      ],
    );
  }
}
