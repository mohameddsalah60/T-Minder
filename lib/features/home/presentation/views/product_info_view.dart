import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';

import 'widgets/product_info_section/product_info_body.dart';

class ProductInfoView extends StatelessWidget {
  const ProductInfoView({super.key});
  static const routeName = 'productInfo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F2),
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Product Info',
          style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const ProductInfoBody(),
    );
  }
}
