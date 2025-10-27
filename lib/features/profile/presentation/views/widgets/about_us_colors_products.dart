import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AboutUsColorsProducts extends StatelessWidget {
  const AboutUsColorsProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '• احمر :',
              style: TextStyles.bold14.copyWith(color: Colors.red),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'المنتج في مرحلة الخطر، باقي أقل من أسبوعين.',
              style: TextStyles.semiBold14,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '• ازرق :',
              style: TextStyles.bold14.copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'المنتج دخل في مرحلة المتابعة، باقي شهر.',
              style: TextStyles.semiBold14,
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '• اخضر :',
              style: TextStyles.bold14.copyWith(color: Colors.green),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              'المنتج في أمان، باقي أكتر من شهر.',
              style: TextStyles.semiBold14,
            ),
          ],
        ),
      ],
    );
  }
}
