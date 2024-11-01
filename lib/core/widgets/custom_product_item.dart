import 'package:flutter/material.dart';

import '../entites/products_entity.dart';
import 'days_left_widget.dart';
import 'title_and_value_row.dart';
import 'zone_product_widget.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.productsEntity,
  });
  final ProductsEntity productsEntity;
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
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TitleAndValueRow(
                  title: 'الباركود :',
                  value: productsEntity.barcode,
                ),
              ),
              ZoneProductWidget(
                daysLeft: productsEntity.daysLeft!,
                text: productsEntity.zone,
              ),
            ],
          ),
          TitleAndValueRow(
            title: 'اسم المنتج :',
            value: productsEntity.nameProduct,
          ),
          TitleAndValueRow(
            title: 'عدد :',
            value: '${productsEntity.qti} قطعة',
          ),
          TitleAndValueRow(
            title: 'الانتهاء :',
            value: productsEntity.exp,
          ),
          const SizedBox(
            height: 8,
          ),
          DaysLeftWidget(daysLeft: productsEntity.daysLeft!),
        ],
      ),
    );
  }
}
