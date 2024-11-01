import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tmart_expiry_date/core/utils/app_images.dart';

import '../utils/app_text_styles.dart';
import 'build_border.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: SizedBox(
          width: 20,
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: SizedBox(
                height: 24,
                child: SvgPicture.asset(Assets.assetsImagesScaner),
              ),
            ),
          ),
        ),
        prefixIcon: SizedBox(
          width: 20,
          child: Center(
            child: SvgPicture.asset(Assets.assetsImagesSearchImg),
          ),
        ),
        filled: true,
        fillColor: Colors.transparent,
        hintText: 'ابحث عن..........',
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xffFFFFFF),
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
      style: TextStyles.semiBold14.copyWith(
        color: const Color(0xffFFFFFF),
      ),
    );
  }
}
