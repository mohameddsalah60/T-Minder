import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tmart_expiry_date/core/utils/app_images.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class AddProductWidget extends StatelessWidget {
  const AddProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, -2),
                blurRadius: 35,
                color: Color(0x19000000),
                spreadRadius: 0,
              ),
            ],
            border: Border.all(
              color: const Color(0xffE6E9E9),
              width: 1,
            )),
        child: Column(
          children: [
            SizedBox(
                height: 170.h,
                width: 190.w,
                child: SvgPicture.asset(
                  Assets.assetsImagesScan2,
                  fit: BoxFit.fill,
                )),
            Text(
              'اضغط هنا لـ اضافة منتج جديد',
              style: TextStyles.semiBold14.copyWith(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
