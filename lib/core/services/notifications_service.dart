import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void Function(NotificationResponse notificationResponse)? onTap;

  // Initialize the notification plugin
  static Future<void> init() async {
    const InitializationSettings settings = InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/launcher_icon'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        ));
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  Future<void> showBasicNotification(
      {String? title, required String body, int? id}) async {
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'Id_1',
        'Product_channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
    await flutterLocalNotificationsPlugin.show(
      id ?? 0,
      title ?? 'تنبيهات الصلاحية',
      body,
      notificationDetails,
    );
  }
}
