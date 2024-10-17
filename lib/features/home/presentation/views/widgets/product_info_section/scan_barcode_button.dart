import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/features/home/presentation/cubits/scan_barcode/scan_barcode_cubit.dart';

class ScanBarcodeButton extends StatelessWidget {
  const ScanBarcodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.r),
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .18,
        child: TextButton(
          onPressed: () {
            context.read<ScanBarcodeCubit>().scanBarcode();
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: AppColors.primaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_rounded,
                color: Colors.white,
                size: 50.r,
              ),
              SizedBox(
                height: 8.r,
              ),
              Text(
                'Scan Barcode Product',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
