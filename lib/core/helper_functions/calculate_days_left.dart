int calculateDaysLeft(DateTime date) {
  date = DateTime(date.year, date.month, date.day);
  DateTime nowDate = DateTime.now();
  return (date.difference(nowDate).inHours / 24).round();
}
