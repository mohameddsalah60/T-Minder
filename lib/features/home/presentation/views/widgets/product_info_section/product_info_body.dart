import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/widgets/show_date_picker.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/widgets/custom_button.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_snack_bar.dart';
import 'package:tmart_expiry_date/features/home/presentation/cubits/scan_barcode/scan_barcode_cubit.dart';

import 'info_data_row.dart';
import 'warning_product_widget.dart';

class ProductInfoBody extends StatefulWidget {
  const ProductInfoBody({
    super.key,
  });

  @override
  State<ProductInfoBody> createState() => _ProductInfoBodyState();
}

class _ProductInfoBodyState extends State<ProductInfoBody> {
  String? textExp1;
  String? textExp2;
  String? dateSelected;
  String? dateSelected_2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.r),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 8.r),
              padding: EdgeInsets.symmetric(
                vertical: 16.r,
                horizontal: 8.r,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'barcode /',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 16.r,
                      ),
                      Text(
                        context.read<ScanBarcodeCubit>().barcode ??
                            'No barcode scanned',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.r,
                  ),
                  const InfoDataRow(
                    textLabel: 'Name /',
                    hintText: 'Product Name',
                  ),
                  SizedBox(
                    height: 16.r,
                  ),
                  InfoDataRow(
                    textLabel: 'Exp 1 /',
                    readOnly: true,
                    hintText: textExp1 ?? '0/0/0000',
                    onChanged: (textExp1) {
                      setState(() {
                        textExp1 = dateSelected!; // تحديث textExp1 هنا
                      });
                    },
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        dateSelected = await buildMaterialDatePicker(context);
                        setState(() {
                          textExp1 = dateSelected;
                        });
                      },
                      child: const Icon(
                        Icons.date_range,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.r,
                  ),
                  const InfoDataRow(
                    textLabel: 'Qte 1 /',
                    hintText: '0',
                  ),
                  SizedBox(
                    height: 16.r,
                  ),
                  InfoDataRow(
                    textLabel: 'Exp 2 /',
                    readOnly: true,
                    hintText: textExp2 ?? '0/0/0000',
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        dateSelected_2 = await buildMaterialDatePicker(context);
                        setState(() {
                          textExp2 = dateSelected_2;
                        });
                      },
                      child: const Icon(
                        Icons.date_range,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.r,
                  ),
                  const InfoDataRow(
                    textLabel: 'Qte 2 /',
                    hintText: '0',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36.r,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.r,
              ),
              child: const WarningProductWidget(),
            ),
            SizedBox(
              height: 24.r,
            ),
            CustomButton(
              text: 'Save',
              onPressed: () {
                if (textExp1 == null) {
                  customShowSnackBar(
                    context,
                    text: 'يجب ادخال علي الاقل تاريخ صلاحية',
                  );
                } else {
                  customShowSnackBar(
                    context,
                    text: 'تم اضافة التعديلات',
                    color: AppColors.greenColor,
                  );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
