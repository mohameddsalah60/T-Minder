String getCurrentTimeWithPeriod() {
  DateTime now = DateTime.now();

  String period = now.hour < 12 ? 'صباحًا' : 'مساءً';

  String formattedTime = "${now.hour % 12 == 0 ? 12 : now.hour % 12}";
  return '$formattedTime $period';
}
