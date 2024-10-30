import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

void customDialogAlert({
  required BuildContext context,
  required String text,
}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          title: Column(
            children: [
              Text(
                text,
                style: TextStyles.semiBold14,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      });
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.of(context).pop();
  });
}
