import 'package:flutter/material.dart';

import 'package:svg_flutter/svg.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        decoration: const ShapeDecoration(
          color: Color(0xffEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .05,
              width: MediaQuery.sizeOf(context).width * .1,
              decoration: const ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
              child: Center(
                  child: SvgPicture.asset(
                image,
                height: MediaQuery.sizeOf(context).height * .026,
              )),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              text,
              style: TextStyles.semiBold11.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
