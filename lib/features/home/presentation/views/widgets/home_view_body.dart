import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/utils/app_colors.dart';
import 'package:tmart_expiry_date/core/utils/app_text_styles.dart';

import 'home_view_categories.dart';
import 'home_view_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeViewHeader(),
              SizedBox(
                height: 16,
              ),
              HomeViewCategories(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CustomProductItem(),
            );
          },
        )
      ],
    );
  }
}

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffE6E9E9),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: TitleAndValueRow(
                      title: 'الباركود :',
                      value: '066665555555',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 6,
                      bottom: 6,
                      left: 8,
                      right: 8,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "زون 4",
                        style: TextStyles.bold13.copyWith(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const TitleAndValueRow(
                title: 'اسم المنتج :',
                value: 'pepsi extra frizzz 600ml',
              ),
              const TitleAndValueRow(
                title: 'عدد :',
                value: '150 قطعة',
              ),
              const TitleAndValueRow(
                title: 'الانتهاء :',
                value: '18/5/2025',
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    '6 عدد ايام متبقية',
                    style: TextStyles.bold16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleAndValueRow extends StatelessWidget {
  const TitleAndValueRow({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.regular16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.bold16,
            ),
          ),
        ],
      ),
    );
  }
}
