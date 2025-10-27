import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/home/domin/entites/zone_category_entity.dart';

import '../../../../../core/products_cubit/products_cubit.dart';
import 'home_view_categories_item.dart';

class HomeViewCategories extends StatefulWidget {
  const HomeViewCategories({
    super.key,
  });

  @override
  State<HomeViewCategories> createState() => _HomeViewCategoriesState();
}

class _HomeViewCategoriesState extends State<HomeViewCategories> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: zoneCategoryItems.asMap().entries.map((e) {
              var index = e.key;
              var entity = e.value;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexSelected = index;
                  });
                  if (index == 0) {
                    context.read<ProductsCubit>().getProducts();
                  } else {
                    context.read<ProductsCubit>().getProductsByFilter(
                        filter: "zone", filterValue: entity.name);
                  }
                },
                child: HomeViewCategoryItem(
                  isSelected: indexSelected == index,
                  zoneCategoryEntity: entity,
                ),
              );
            }).toList(),
          ),
        ));
  }
}
