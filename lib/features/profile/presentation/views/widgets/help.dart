import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/profile/presentation/views/about_us.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'custom_profile_item.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'المساعدة',
            style: TextStyles.bold14.copyWith(
              color: const Color(0xff000000),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomProfileItem(
          title: 'من نحن',
          assetName: Assets.assetsImagesInfoRound,
          onTap: () => Navigator.of(context).pushNamed(AboutUs.routeName),
        ),
      ],
    );
  }
}
