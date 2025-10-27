import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/delete_products_cubit/delete_products_cubit.dart';

import '../entites/products_entity.dart';
import '../helper_functions/get_user.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'appbar_detailes_view.dart';
import 'custom_button.dart';
import 'custom_dialog_alert.dart';
import 'title_and_value_row.dart';

class ProductDetailesViewBody extends StatelessWidget {
  const ProductDetailesViewBody({
    super.key,
    required this.product,
  });
  final ProductsEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .55,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppBarDetailesView(),
            TitleAndValueRow(
              title: 'الباركود :',
              value: product.barcode,
            ),
            TitleAndValueRow(
              title: 'اسم المنتج :',
              value: product.nameProduct,
            ),
            TitleAndValueRow(
              title: 'عدد :',
              value: '${product.qti} قطعة',
            ),
            TitleAndValueRow(
              title: 'اضافه :',
              value: product.nameBy,
            ),
            TitleAndValueRow(
              title: 'ملحوظة :',
              child: Expanded(
                child: Text(
                  product.note!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.bold16,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'زون',
                        style: TextStyles.bold16,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(product.zone.replaceFirst('زون ', ''),
                          style: TextStyles.semiBold16),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'تاريخ الانتهاء',
                        style: TextStyles.bold16,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        product.exp,
                        style: TextStyles.semiBold16,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'المتبقي',
                        style: TextStyles.bold16,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text("${product.daysLeft} يوم",
                          style: TextStyles.semiBold16),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomButton(
              onPressed: () {
                if (getUser().zone == product.zone.replaceFirst('زون ', '')) {
                  context.read<DeleteProductsCubit>().deleteProducts(
                        barcode: product.barcode,
                      );
                } else {
                  customDialogAlert(
                    context: context,
                    text: 'يجب ان تكون في نفس الزون',
                  );
                }
              },
              text: "حذف المنتج",
              backgroundColor: Colors.red,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                'العودة الي الخلف',
                style: TextStyles.bold14.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
