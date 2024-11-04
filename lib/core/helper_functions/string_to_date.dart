stringToDate(String string) {
  if (string.isNotEmpty) {
    List<String> parts = string.split('/');
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    return DateTime(year, month, day);
  }
}
