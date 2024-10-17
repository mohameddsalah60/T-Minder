import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmart_expiry_date/core/widgets/custom_show_snack_bar.dart';
import 'package:tmart_expiry_date/features/home/presentation/cubits/scan_barcode/scan_barcode_cubit.dart';
import 'package:tmart_expiry_date/features/home/presentation/views/product_info_view.dart';

import '../product_info_section/scan_barcode_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanBarcodeCubit, ScanBarcodeState>(
      listener: (context, state) {
        if (state is ScanBarcodefailure) {
          customShowSnackBar(context, text: state.error);
        } else {
          Navigator.of(context).pushNamed(
            ProductInfoView.routeName,
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: const Center(
          child: ScanBarcodeButton(),
        ),
      ),
    );
  }
}
