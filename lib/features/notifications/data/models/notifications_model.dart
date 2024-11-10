import 'package:tmart_expiry_date/features/notifications/domin/entites/notifications_entity.dart';

class NotificationsModel extends NotificationsEntity {
  NotificationsModel(
      {required super.body,
      required super.time,
      super.isSeen,
      required super.uId,
      required super.notificationId,
      required super.createAt});

  factory NotificationsModel.fromEntity(
      NotificationsEntity notificationsEntity) {
    return NotificationsModel(
      body: notificationsEntity.body,
      time: notificationsEntity.time,
      isSeen: notificationsEntity.isSeen,
      uId: notificationsEntity.uId,
      notificationId: notificationsEntity.notificationId,
      createAt: notificationsEntity.createAt,
    );
  }
  factory NotificationsModel.fromJson(Map<String, dynamic> data) {
    return NotificationsModel(
      body: data['body'] ?? '',
      time: data['time'] ?? '',
      uId: data['uId'] ?? '',
      isSeen: data['isSeen'] ?? false,
      notificationId: data['notificationId'] ?? '',
      createAt: data['createAt'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'time': time,
      'isSeen': isSeen,
      'uId': uId,
      'notificationId': notificationId,
      'createAt': createAt,
    };
  }
}
