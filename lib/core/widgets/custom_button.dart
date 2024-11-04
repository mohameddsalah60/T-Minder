import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.text, this.backgroundColor});
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .058,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: backgroundColor == Colors.white
                ? const BorderSide(color: AppColors.primaryColor)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
        child: Text(
          text,
          style: TextStyles.bold14.copyWith(
            color: backgroundColor == Colors.white
                ? AppColors.primaryColor
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
