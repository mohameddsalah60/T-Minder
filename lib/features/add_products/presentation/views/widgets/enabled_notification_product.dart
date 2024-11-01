import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_checkbox.dart';

class EnabledNotificationProduct extends StatelessWidget {
  const EnabledNotificationProduct({
    super.key,
    required this.isEnabled,
    required this.onChanged,
  });
  final bool isEnabled;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(onChanged: onChanged, value: isEnabled),
        Text(
          'تفعيل الاشعارات لهذه المنتج',
          style: TextStyles.semiBold14,
        ),
      ],
    );
  }
}
