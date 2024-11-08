import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../utils/app_images.dart';
import '../utils/app_text_styles.dart';

class CustomNoFoundDataWidget extends StatelessWidget {
  const CustomNoFoundDataWidget({
    super.key,
    this.data,
  });
  final String? data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height * .35,
            child: SvgPicture.asset(Assets.assetsImagesNoDataFound)),
        Text(
          data ?? 'لا يوجد بيانات في الوقت الحالي',
          style: TextStyles.semiBold14,
        ),
      ],
    );
  }
}
