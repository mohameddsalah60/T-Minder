class NotificationsEntity {
  final String body, time, uId, notificationId;
  bool? isSeen;

  NotificationsEntity({
    required this.notificationId,
    required this.uId,
    required this.body,
    required this.time,
    this.isSeen,
  });
}
