class ProductsEntity {
  final String barcode, nameProduct, nameBy, zone, exp, qti, uId;
  final String? note;
  int? daysLeft;
  final bool isNotification;
  ProductsEntity({
    required this.barcode,
    required this.nameProduct,
    required this.nameBy,
    required this.zone,
    required this.exp,
    required this.qti,
    required this.uId,
    required this.note,
    required this.isNotification,
    this.daysLeft,
  });
}
