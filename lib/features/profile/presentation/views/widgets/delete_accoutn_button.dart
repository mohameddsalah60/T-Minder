import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import 'custom_profile_item.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomProfileItem(
      title: 'حذف الحساب',
      assetName: Assets.assetsImagesUserDelete,
      color: Colors.red,
    );
  }
}
