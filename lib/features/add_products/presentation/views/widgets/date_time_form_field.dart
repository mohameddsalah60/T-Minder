import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/build_border.dart';

class CustomDateTimeField extends StatelessWidget {
  const CustomDateTimeField({super.key, this.onChanged, this.autovalidateMode});
  final void Function(DateTime?)? onChanged;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      autovalidateMode: autovalidateMode,
      lastDate: DateTime(2030),
      firstDate: DateTime(DateTime.now().year),
      clearIconData: Icons.remove_circle_outline,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.date_range),
        suffixIconColor: AppColors.primaryColor,
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        hintText: 'تاريخ الانتهاء',
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        focusedBorder: buildBorder(),
        enabledBorder: buildBorder(),
        border: buildBorder(),
      ),
      style: TextStyles.semiBold14.copyWith(
        color: const Color(0xff000000),
      ),
      pickerPlatform: DateTimeFieldPickerPlatform.cupertino,
      mode: DateTimeFieldPickerMode.date,
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }
}
