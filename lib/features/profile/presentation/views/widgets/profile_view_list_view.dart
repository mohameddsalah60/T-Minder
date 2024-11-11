import 'package:flutter/material.dart';

import '../../../domin/entites/profile_entity.dart';
import 'custom_profile_item.dart';

class ProfileViewListView extends StatelessWidget {
  const ProfileViewListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        items.length,
        (index) => CustomProfileItem(
          title: items[index].title,
          assetName: items[index].img,
          onTap: () =>
              Navigator.of(context).pushNamed(items[index].toRouteView),
        ),
      ),
    );
  }
}
