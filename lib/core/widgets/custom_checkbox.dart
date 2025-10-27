import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.onChanged,
    required this.value,
  });
  final bool value;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.3,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColor,
        side: const BorderSide(width: 1.5, color: Color(0xffDDDFDF)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
