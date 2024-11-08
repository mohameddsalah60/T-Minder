import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({
    super.key,
    this.onTap,
    required this.title,
    required this.assetName,
    this.color,
  });
  final void Function()? onTap;
  final String title, assetName;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.all(0),
      leading: SizedBox(
        height: 20.h,
        width: 20.w,
        child: SvgPicture.asset(assetName),
      ),
      title: Text(
        title,
        style: TextStyles.semiBold14.copyWith(
          color: color ?? AppColors.primaryColor,
        ),
      ),
      trailing: Icon(
        Icons.arrow_circle_left,
        size: 29,
        color: color ?? AppColors.primaryColor,
      ),
    );
  }
}
