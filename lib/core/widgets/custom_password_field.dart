import 'package:flutter/material.dart';

import 'custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, required this.onSaved});
  final void Function(String?) onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFromField(
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      obscureText: isVisible,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          if (isVisible) {
            setState(() {
              isVisible = false;
            });
          } else {
            setState(() {
              isVisible = true;
            });
          }
        },
        icon: isVisible
            ? const Icon(
                Icons.visibility,
                size: 20,
              )
            : const Icon(
                Icons.visibility_off,
                size: 20,
              ),
      ),
    );
  }
}
