import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/home/domin/entites/bottom_navigation_bar_entity.dart';

import 'active_item.dart';
import 'in_active_item.dart';

class NavigationBarItemBottom extends StatelessWidget {
  const NavigationBarItemBottom(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarItem});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarItem;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            text: bottomNavigationBarItem.name,
            image: bottomNavigationBarItem.activeImage,
          )
        : InActiveItem(
            image: bottomNavigationBarItem.inActiveImage,
          );
  }
}
