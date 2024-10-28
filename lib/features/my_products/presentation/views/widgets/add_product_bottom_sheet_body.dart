import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_date_picker.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';
import 'package:tmart_expiry_date/features/my_products/presentation/views/widgets/note_text_field.dart';
import 'package:tmart_expiry_date/features/my_products/presentation/views/widgets/qty_text_field.dart';

import 'appbar_bottom_sheet.dart';
import 'enabled_notification_product.dart';
import 'show_dropdown_zones.dart';

class AddProductsBottomSheetBody extends StatefulWidget {
  const AddProductsBottomSheetBody({
    super.key,
    required this.barcode,
  });
  final String barcode;

  @override
  State<AddProductsBottomSheetBody> createState() =>
      _AddProductsBottomSheetBodyState();
}

class _AddProductsBottomSheetBodyState
    extends State<AddProductsBottomSheetBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController barcodeField = TextEditingController();
  final TextEditingController zoneField = TextEditingController();
  final TextEditingController qtyField = TextEditingController();
  final TextEditingController dateField = TextEditingController();
  final TextEditingController nameField = TextEditingController();
  final TextEditingController noteField = TextEditingController();
  bool isNotification = true;
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const AppBarBottomSheet(),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFromField(
                    controller: barcodeField,
                    hintText: barcodeField.text = widget.barcode,
                    enabled: false,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      value = widget.barcode;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFromField(
                    hintText: 'اسم المنتج',
                    controller: nameField,
                    onChanged: (value) {
                      nameField.text = value;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      QtyTextField(controllerQtiField: qtyField),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () => showDropdownZones(
                            context,
                            controller: zoneField,
                          ),
                          child: CustomTextFromField(
                            hintText: 'الزون',
                            enabled: false,
                            controller: zoneField,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var date = await customShowDatePicker(context);
                      setState(() {
                        dateField.text = date;
                      });
                    },
                    child: CustomTextFromField(
                      hintText: 'تاريخ الانتهاء',
                      keyboardType: TextInputType.datetime,
                      controller: dateField,
                      enabled: false,
                      onSaved: (value) {
                        if (dateField.text.isNotEmpty) {
                          value = dateField.text;
                        }
                      },
                      suffixIcon: const Icon(
                        Icons.date_range_sharp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  NoteTextField(textEditingController: noteField),
                  const SizedBox(
                    height: 12,
                  ),
                  EnabledNotificationProduct(
                    isEnabled: isNotification,
                    onChanged: (value) {
                      setState(() {
                        isNotification = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                    text: 'اضافة',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomButton(
                    text: 'رجوع',
                    backgroundColor: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
