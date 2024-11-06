import 'dart:developer';

import 'package:workmanager/workmanager.dart';
import 'package:tmart_expiry_date/core/services/notifications_service.dart';

import '../entites/products_entity.dart';

class WorkmanagerService {
  static final Workmanager workmanager = Workmanager();

  static Future<void> init() async {
    await workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  }

  static void registerProductNotifications(ProductsEntity productEntity) {
    Workmanager().registerPeriodicTask(
      productEntity.barcode,
      'sendNotification',
      frequency: const Duration(days: 1),
      initialDelay: Duration(days: productEntity.daysLeft!),
      inputData: {
        'barcode': productEntity.barcode,
        'daysLeft': productEntity.daysLeft,
      },
    );
    log('Task scheduled with periodic checks every day');
  }

  static void cancelByUniqueName(String string) async {
    await workmanager.cancelByUniqueName(string);
  }
}

// Callback dispatcher for background task
// Callback dispatcher for background task
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    int daysLeft = inputData!['daysLeft'];
    String barcode = inputData['barcode'];

    if (task == 'sendNotification') {
      if (daysLeft == 30) {
        // Notification for 30 days remaining

        NotificationsService.showBasicNotification(
          body: 'تبقي 30 يوم علي انتهاء المنتج : $barcode',
          id: int.parse(barcode),
        );
      } else if (daysLeft == 7) {
        // Notification for 7 days remaining
        NotificationsService.showBasicNotification(
          body: 'تبقي 7 يوم علي انتهاء المنتج : $barcode',
          id: int.parse(barcode),
        );
      } else if (daysLeft == 0) {
        NotificationsService.showBasicNotification(
          body: 'تم انتهاء صلاحية المنتج : $barcode وازالته',
          id: int.parse(barcode),
        );

        WorkmanagerService.cancelByUniqueName(barcode);
      }
      return Future.value(true);
    }
    return Future.value(false);
  });
}
