import 'package:flutter/material.dart';

import 'appbar_bottom_sheet.dart';

class AddProductsBottomSheetBody extends StatelessWidget {
  const AddProductsBottomSheetBody({
    super.key,
    required this.barcode,
  });
  final String barcode;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarBottomSheet(),
        Text(barcode),
      ],
    );
  }
}
