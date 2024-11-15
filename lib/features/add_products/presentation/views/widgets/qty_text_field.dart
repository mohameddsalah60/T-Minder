import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';

class QtyTextField extends StatefulWidget {
  const QtyTextField({super.key, required this.controllerQtiField});
  final TextEditingController controllerQtiField;
  @override
  State<QtyTextField> createState() => _QtyTextFieldState();
}

class _QtyTextFieldState extends State<QtyTextField> {
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomTextFromField(
        hintText: 'عدد المنتج',
        keyboardType: TextInputType.number,
        controller: widget.controllerQtiField,
        onSaved: (value) {
          qty = 0;
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            qty = int.tryParse(value) ?? 0;
          } else {
            qty = 0;
          }
        },
        suffixIcon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  qty += 1;
                  widget.controllerQtiField.text = qty.toString();
                });
              },
              child: const Icon(
                Icons.arrow_drop_up,
                color: AppColors.primaryColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (qty != 0) {
                    qty -= 1;
                    widget.controllerQtiField.text = qty.toString();
                  }
                });
              },
              child: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
