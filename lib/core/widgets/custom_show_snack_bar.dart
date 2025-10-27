import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

customShowSnackBar(BuildContext context,
    {required String text, Color color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        style: TextStyles.semiBold14,
      ),
    ),
  );
}
