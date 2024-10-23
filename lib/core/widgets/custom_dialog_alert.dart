import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void customDialogAlert({
  required BuildContext context,
  String? title,
  required String text,
  required String type,
}) {
  QuickAlert.show(
    context: context,
    type: typeQuickAlert(type),
    text: text,
    showConfirmBtn: false,
    showCancelBtn: false,
    title: title,
    autoCloseDuration: const Duration(
      seconds: 3,
    ),
  );
}

QuickAlertType typeQuickAlert(String type) {
  switch (type) {
    case "success":
      return QuickAlertType.success;
    case "info":
      return QuickAlertType.info;
    case "error":
      return QuickAlertType.error;
    case "warning":
      return QuickAlertType.warning;
    default:
      return QuickAlertType.custom;
  }
}
