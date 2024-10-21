import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void customDialogAlert({
  required BuildContext context,
  required String title,
  required String text,
  required QuickAlertType type,
}) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    text: text,
    showConfirmBtn: false,
    showCancelBtn: false,
    title: title,
    autoCloseDuration: const Duration(
      seconds: 3,
    ),
  );
}
