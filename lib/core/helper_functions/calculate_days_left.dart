import '../errors/custom_exception.dart';

int calculateDaysLeft(DateTime date) {
  date = DateTime(date.year, date.month, date.day);
  DateTime nowDate = DateTime.now();
  if (date.isBefore(nowDate)) {
    throw CustomException(message: "برجاء ادخال تاريخ صحيح");
  } else {
    return (date.difference(nowDate).inHours / 24).round();
  }
}
