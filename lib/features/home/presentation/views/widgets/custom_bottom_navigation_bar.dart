import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/features/home/domin/entites/bottom_navigation_bar_entity.dart';
import 'navigation_bar_item_bottom.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .07,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 25,
            color: Color(0x19000000),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarItem.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;
          return Expanded(
            flex: index == currentIndex ? 2 : 1,
            child: GestureDetector(
              onTap: () => onTap(index), // استدعاء الدالة عند الضغط
              child: NavigationBarItemBottom(
                isSelected: currentIndex == index,
                bottomNavigationBarItem: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
