import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class SocialSignInButton extends StatelessWidget {
  const SocialSignInButton(
      {super.key, this.onPressed, required this.text, required this.img});
  final void Function()? onPressed;
  final String text;
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xffDDDFDF)),
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: Colors.white,
          ),
          child: ListTile(
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            leading: SvgPicture.asset(img),
            title: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold14.copyWith(color: Colors.black),
            ),
          )),
    );
  }
}
