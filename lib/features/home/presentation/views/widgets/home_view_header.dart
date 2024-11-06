import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';

import 'custom_home_appbar.dart';
import 'home_view_search_field.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: const Column(
        children: [
          SizedBox(
            height: 34,
          ),
          CustomHomeAppbar(),
          SizedBox(
            height: 16,
          ),
          HomeViewSearchField(),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
