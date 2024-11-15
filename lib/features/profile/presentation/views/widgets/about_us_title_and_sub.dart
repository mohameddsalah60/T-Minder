import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class AboutUsTitleAndSub extends StatelessWidget {
  final String title;
  final String subtitle;

  const AboutUsTitleAndSub(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.bold14,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyles.semiBold14,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
