import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void Function(NotificationResponse notificationResponse)? onTap;

  // Initialize the notification plugin
  static Future<void> init() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/launcher_icon'),
    );
    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  static Future<void> showScheduledNotification({
    required DateTime expiryDate,
    required int daysLeft,
    required String barcode,
  }) async {
    // Initialize time zones
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    // Notification details
    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        'Id_3',
        'Product_channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    // Calculate the trigger time based on the daysLeft
    DateTime notificationTime;
    String message;

    if (daysLeft == 30) {
      notificationTime = expiryDate.subtract(const Duration(days: 30));
      message = 'سيتم انتهاء صلاحية المنتج بعد 30 يوم. الباركود: $barcode';
    } else if (daysLeft == 7) {
      notificationTime = expiryDate.subtract(const Duration(days: 7));
      message = 'سيتم انتهاء صلاحية المنتج بعد أسبوع. الباركود: $barcode';
    } else if (daysLeft <= 2) {
      notificationTime = expiryDate.subtract(const Duration(days: 2));
      message = 'سيتم انتهاء صلاحية المنتج خلال يومين. الباركود: $barcode';
    } else if (daysLeft == 0) {
      notificationTime = expiryDate;
      message = 'تم انتهاء صلاحية المنتج وتم حذفه. الباركود: $barcode';
    } else {
      return;
    }
    tz.TZDateTime scheduledTime = tz.TZDateTime(
        tz.local,
        notificationTime.year,
        notificationTime.month,
        notificationTime.day,
        notificationTime.hour,
        notificationTime.minute);
    if (scheduledTime.isBefore(tz.TZDateTime.now(tz.local))) {
      // If the scheduled time is in the past, schedule it for 5 minutes later
      scheduledTime =
          tz.TZDateTime.now(tz.local).add(const Duration(seconds: 30));
    }
    // Scheduling the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'تنبيهات الصلاحية',
      message,
      scheduledTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
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
