class AddProductInputEntity {
  final String barcode, nameProduct, nameBy, zone, exp, qti, uId, note;
  final String? daysLeft;
  final bool isNotification;
  AddProductInputEntity({
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
