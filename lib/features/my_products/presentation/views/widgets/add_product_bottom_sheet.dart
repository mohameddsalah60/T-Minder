import 'package:flutter/material.dart';

import 'add_product_bottom_sheet_body.dart';

Future<dynamic> addProductsBottomSheet(BuildContext context,
    {required String barcode}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height - 30,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: AddProductsBottomSheetBody(
            barcode: barcode,
          ),
        ),
      );
    },
  );
}
