import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

import '../utils/app_colors.dart';
import 'title_and_value_row.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 16,
        top: 6,
        left: 16,
        right: 16,
      ),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffE6E9E9),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: TitleAndValueRow(
                  title: 'الباركود :',
                  value: '066665555555',
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 6,
                  bottom: 6,
                  left: 8,
                  right: 8,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    "زون 4",
                    style: TextStyles.bold13.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          const TitleAndValueRow(
            title: 'اسم المنتج :',
            value: 'pepsi extra frizzz 600ml',
          ),
          const TitleAndValueRow(
            title: 'عدد :',
            value: '150 قطعة',
          ),
          const TitleAndValueRow(
            title: 'الانتهاء :',
            value: '18/5/2025',
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '6 عدد ايام متبقية',
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
