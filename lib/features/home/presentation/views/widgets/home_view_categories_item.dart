import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/features/home/domin/entites/zone_category_entity.dart';

class HomeViewCategoryItem extends StatelessWidget {
  const HomeViewCategoryItem({
    super.key,
    required this.isSelected,
    required this.zoneCategoryEntity,
  });
  final bool isSelected;
  final ZoneCategoryEntity zoneCategoryEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 80.w,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : null,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE6E9E9),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          zoneCategoryEntity.name,
          style: TextStyles.semiBold14.copyWith(
            color: isSelected ? const Color(0xffFFFFFF) : null,
          ),
        ),
      ),
    );
  }
}
