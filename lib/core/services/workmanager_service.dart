import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tmart_expiry_date/core/repos/notifications_repo.dart';
import 'package:tmart_expiry_date/core/services/getit_service.dart';
import 'package:workmanager/workmanager.dart';

import '../../firebase_options.dart';
import '../entites/products_entity.dart';
import 'shared_preferences_singletone.dart';

class WorkmanagerService {
  static final Workmanager workmanager = Workmanager();
  final NotificationsRepo notificationsRepo;

  WorkmanagerService({required this.notificationsRepo});
  static Future<void> init() async {
    await workmanager.initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );
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

  static Future<void> cancelByUniqueName(String string) async {
    await workmanager.cancelByUniqueName(string);
  }

  static Future<void> cancelAll() async {
    await workmanager.cancelAll();
  }
}

// Callback dispatcher for background task
// Callback dispatcher for background task
@pragma('vm:entry-point')
void callbackDispatcher() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();

  setupGetItService();

  Workmanager().executeTask((task, inputData) async {
    int daysLeft = inputData!['daysLeft'];
    String barcode = inputData['barcode'];
    NotificationsRepo notificationsRepo = getIt<NotificationsRepo>();

    if (task == 'sendNotification') {
      if (daysLeft == 30) {
        // Notification for 30 days remaining
        notificationsRepo.showBasicNotification(
          body: 'سيتم انتهاء صلاحية المنتج بعد 30 يوم. الباركود: $barcode',
          id: int.parse(barcode),
        );
      } else if (daysLeft == 7) {
        // Notification for 7 days remaining

        notificationsRepo.showBasicNotification(
          body: 'سيتم انتهاء صلاحية المنتج بعد اسبوع. الباركود: $barcode',
          id: int.parse(barcode),
        );
      } else if (daysLeft == 0) {
        notificationsRepo.showBasicNotification(
          body: 'تم انتهاء صلاحية المنتج وتم حذفه. الباركود: $barcode',
          id: int.parse(barcode),
        );

        WorkmanagerService.cancelByUniqueName(barcode);
      }
      return Future.value(true);
    }
    return Future.value(false);
  });
}
