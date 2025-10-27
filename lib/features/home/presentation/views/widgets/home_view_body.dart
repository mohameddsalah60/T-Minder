import 'package:flutter/material.dart';

import '../../../../../core/widgets/product_item_sliver_list.dart';
import 'home_view_categories.dart';
import 'home_view_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
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
        ProductItemSliverList(),
      ],
    );
  }
}
