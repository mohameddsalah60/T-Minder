import 'package:tmart_expiry_date/core/utils/app_images.dart';
import 'package:tmart_expiry_date/features/add_products/presentation/views/my_products_view.dart';
import 'package:tmart_expiry_date/features/auth/presentation/views/select_zone_view.dart';

class ProfileEntity {
  final String title, img, toRouteView;

  ProfileEntity(
      {required this.toRouteView, required this.title, required this.img});
}

List<ProfileEntity> get items => [
      ProfileEntity(
        title: 'تغير الزون',
        img: Assets.assetsImagesBox,
        toRouteView: SelectZoneView.routeName,
      ),
      ProfileEntity(
        title: 'اضافاتي السابقة',
        img: Assets.assetsImagesBox,
        toRouteView: MyProductsView.routeName,
      ),
    ];
