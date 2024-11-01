import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:tmart_expiry_date/core/helper_functions/calculate_days_left.dart';
import 'package:tmart_expiry_date/core/helper_functions/get_user.dart';
import 'package:tmart_expiry_date/core/helper_functions/string_to_date.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_images.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_dialog_alert.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_date_picker.dart';
import 'package:tmart_expiry_date/core/widgets/custom_text_field.dart';
import 'package:tmart_expiry_date/core/entites/products_entity.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/add_products_cubit/add_products_cubit.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/views/my_products_view.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/views/widgets/note_text_field.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/views/widgets/qty_text_field.dart';

import 'enabled_notification_product.dart';
import 'show_dropdown_zones.dart';

class AddProductsViewBody extends StatefulWidget {
  const AddProductsViewBody({
    super.key,
  });
  @override
  State<AddProductsViewBody> createState() => _AddProductsViewBodyState();
}

class _AddProductsViewBodyState extends State<AddProductsViewBody> {
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
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: BlocListener<AddProductsCubit, AddProductsState>(
                listener: (context, state) {
                  if (state is GetBarcodeSuccsess) {
                    barcodeField.text = state.barcode;
                  } else if (state is GetBarcodeFailure) {
                    customDialogAlert(
                      context: context,
                      text: state.message,
                    );
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFromField(
                      hintText: barcodeField.text.isEmpty
                          ? 'الباركود'
                          : barcodeField.text,
                      controller: barcodeField,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        value = barcodeField.text;
                      },
                      suffixIcon: SizedBox(
                        width: 20,
                        child: GestureDetector(
                          onTap: () {
                            context.read<AddProductsCubit>().getBarcode();
                          },
                          child: Center(
                            child: SizedBox(
                              height: 26,
                              child: SvgPicture.asset(Assets.assetsImagesScan2),
                            ),
                          ),
                        ),
                      ),
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
                          if (calculateDaysLeft(stringToDate(dateField.text)) <=
                              90) {
                            formKey.currentState!.save();
                            ProductsEntity addProductInputEntity =
                                ProductsEntity(
                              barcode: barcodeField.text,
                              nameProduct: nameField.text,
                              zone: zoneField.text,
                              exp: dateField.text,
                              qti: qtyField.text,
                              note: noteField.text.isEmpty
                                  ? 'لا يوجد'
                                  : noteField.text,
                              isNotification: isNotification,
                              nameBy: getUser().name,
                              uId: getUser().uId,
                            );
                            context.read<AddProductsCubit>().addProductInput(
                                  addProductInputEntity: addProductInputEntity,
                                );
                          } else {
                            customDialogAlert(
                              context: context,
                              text: 'لا يمكن اضافة تاريخ اكثر من 3 شهور',
                            );
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomButton(
                      text: 'اضافاتي السابقة',
                      backgroundColor: Colors.white,
                      onPressed: () => Navigator.pushNamed(
                          context, MyProductsView.routeName),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
