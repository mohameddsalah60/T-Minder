import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/home/domin/entites/zone_category_entity.dart';

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
