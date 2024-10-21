import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';

class CustomLoadingIndector extends StatelessWidget {
  const CustomLoadingIndector(
      {super.key, required this.isLoading, required this.child});
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      color: AppColors.primaryColor,
      inAsyncCall: isLoading,
      child: child,
    );
  }
}
