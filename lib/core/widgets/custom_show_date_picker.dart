import 'package:flutter/material.dart';

Future<String> customShowDatePicker(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(DateTime.now().year),
    lastDate: DateTime(2030),
  );
  if (picked != null) {
    return "${picked.year}/${picked.month}/${picked.day}";
  } else {
    return '';
  }
}
