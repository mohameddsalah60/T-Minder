import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_product_item.dart';

class MyProductsWidget extends StatelessWidget {
  const MyProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'اضافاتي',
              style: TextStyles.bold16,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'عرض الكل',
                style: TextStyles.semiBold14.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              5,
              (index) {
                return const CustomProductItem();
              },
            ),
          ),
        ),
      ],
    );
  }
}
