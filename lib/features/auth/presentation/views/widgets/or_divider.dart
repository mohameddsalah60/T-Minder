import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffDDDFDF), /////// بتتحكم في اللون
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'أو',
            style: TextStyles.semiBold14,
          ),
        ),
        const Expanded(
          child: Divider(
            color: Color(0xffDDDFDF), /////// بتتحكم في اللون
          ),
        ),
      ],
    );
  }
}
