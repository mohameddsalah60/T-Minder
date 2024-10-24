import 'package:tmart_expiry_date/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String inActiveImage, activeImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.inActiveImage,
      required this.activeImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItem => [
      BottomNavigationBarEntity(
        activeImage: Assets.assetsImagesIconsBottomBoldHome,
        inActiveImage: Assets.assetsImagesIconsBottomOutlineHome,
        name: 'الرئيسية',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.assetsImagesIconsBottomBoldProducts,
        inActiveImage: Assets.assetsImagesIconsBottomOutlineProducts,
        name: 'منتجاتي',
      ),
      BottomNavigationBarEntity(
        activeImage: Assets.assetsImagesIconsBottomBoldUser,
        inActiveImage: Assets.assetsImagesIconsBottomOutlineUser,
        name: 'حسابي',
      ),
    ];
