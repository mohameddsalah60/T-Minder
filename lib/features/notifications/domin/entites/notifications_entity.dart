class NotificationsEntity {
  final String body, time, uId, notificationId;
  bool? isSeen;
  final DateTime createAt;

  NotificationsEntity({
    required this.notificationId,
    required this.uId,
    required this.body,
    required this.time,
    required this.createAt,
    this.isSeen,
  });
}
