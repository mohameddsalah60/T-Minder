import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/build_border.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({super.key, required this.textEditingController});
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'ملحوظة اضافية',
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        hintStyle: TextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
      ),
      maxLines: 2,
      controller: textEditingController,
      style: TextStyles.semiBold14.copyWith(
        color: const Color(0xff000000),
      ),
      onSubmitted: (value) {
        textEditingController.text = value;
      },
    );
  }
}
