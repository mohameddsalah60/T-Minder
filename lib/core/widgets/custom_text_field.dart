import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

import 'build_border.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      this.suffixIcon,
      this.obscureText = false,
      this.onSaved});
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: const Color(0XffC9CECF),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        hintText: hintText,
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
      style: TextStyles.semiBold16.copyWith(
        color: const Color(0xff000000),
      ),
    );
  }
}
