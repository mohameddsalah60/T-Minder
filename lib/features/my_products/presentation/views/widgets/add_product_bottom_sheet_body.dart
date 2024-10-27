import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_checkbox.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_date_picker.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';

import 'appbar_bottom_sheet.dart';

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
  final TextEditingController controllerBarcodeField = TextEditingController();
  final TextEditingController controllerZoneField = TextEditingController();
  final TextEditingController controllerQtiField = TextEditingController();
  final TextEditingController controllerDateField = TextEditingController();

  int qti = 0;
  List<String> zones = ['زون 1', 'زون 2', 'زون 3', 'زون 4'];
  @override
  void initState() {
    controllerBarcodeField.text = widget.barcode;
    super.initState();
  }

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
                    controller: controllerBarcodeField,
                    hintText: 'الباركود',
                    enabled: false,
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      value = widget.barcode;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomTextFromField(hintText: 'اسم المنتج'),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: CustomTextFromField(
                          hintText: 'عدد المنتج',
                          keyboardType: TextInputType.number,
                          controller: controllerQtiField,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              qti = int.tryParse(value) ?? 0;
                            } else {
                              qti = 0;
                            }
                          },
                          suffixIcon: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    qti += 1;
                                    controllerQtiField.text = qti.toString();
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
                                    if (qti != 0) {
                                      qti -= 1;
                                      controllerQtiField.text = qti.toString();
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
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () => showDropdownZones(context),
                          child: CustomTextFromField(
                            hintText: 'الزون',
                            enabled: false,
                            controller: controllerZoneField,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFromField(
                    hintText: 'تاريخ الانتهاء',
                    keyboardType: TextInputType.datetime,
                    controller: controllerDateField,
                    onSaved: (value) {
                      if (controllerDateField.text.isNotEmpty) {
                        value = controllerDateField.text;
                      }
                    },
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        var date = await customShowDatePicker(context);
                        setState(() {
                          controllerDateField.text = date;
                        });
                      },
                      child: const Icon(
                        Icons.date_range_sharp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      CustomCheckbox(onChanged: (value) {}, value: true),
                      Text(
                        'تفعيل الاشعارات لهذه المنتج',
                        style: TextStyles.semiBold14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const CustomButton(text: 'اضافة'),
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

  void showDropdownZones(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('اختار الزون'),
          content: SizedBox(
            height: 200.h,
            width: double.maxFinite,
            child: ListView.builder(
                itemCount: zones.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(zones[index]),
                    onTap: () {
                      setState(() {
                        controllerZoneField.text = zones[index];
                      });
                      Navigator.of(context).pop();
                    },
                  );
                }),
          ),
        );
      },
    );
  }
}
