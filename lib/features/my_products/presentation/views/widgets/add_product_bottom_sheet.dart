import 'package:flutter/material.dart';

import 'add_product_bottom_sheet_body.dart';

Future<dynamic> addProductsBottomSheet(BuildContext context,
    {required String barcode}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    builder: (context) {
      return SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
          ),
          child: AddProductsBottomSheetBody(
            barcode: barcode,
          ),
        ),
      );
    },
  );
}
