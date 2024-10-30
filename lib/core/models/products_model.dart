import 'package:tmart_expiry_date/core/entites/products_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel(
      {required super.barcode,
      required super.nameProduct,
      required super.nameBy,
      required super.zone,
      required super.exp,
      required super.qti,
      required super.uId,
      required super.note,
      required super.isNotification,
      super.daysLeft});
  factory ProductsModel.fromEntity(ProductsEntity addProductInputEntity) {
    return ProductsModel(
      barcode: addProductInputEntity.barcode,
      nameProduct: addProductInputEntity.nameProduct,
      exp: addProductInputEntity.exp,
      zone: addProductInputEntity.zone,
      qti: addProductInputEntity.qti,
      note: addProductInputEntity.note,
      daysLeft: addProductInputEntity.daysLeft,
      isNotification: addProductInputEntity.isNotification,
      uId: addProductInputEntity.uId,
      nameBy: addProductInputEntity.nameBy,
    );
  }

  toMap() {
    return {
      'barcode': barcode,
      'nameProduct': nameProduct,
      'exp': exp,
      'zone': zone,
      'qti': qti,
      'note': note ?? 'لا يوجد',
      'daysLeft': daysLeft,
      'isNotification': isNotification,
      'uId': uId,
      'nameBy': nameBy,
    };
  }
}
