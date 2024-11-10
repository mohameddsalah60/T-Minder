import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:tmart_expiry_date/core/services/database_service.dart';
import 'package:tmart_expiry_date/core/services/notifications_service.dart';
import 'package:uuid/uuid.dart';

import '../../features/notifications/data/models/notifications_model.dart';
import '../../features/notifications/domin/entites/notifications_entity.dart';
import '../errors/custom_exception.dart';
import '../errors/failures.dart';
import '../helper_functions/get_current_time_with_period.dart';
import '../helper_functions/get_user.dart';
import '../utils/backend_endpoint.dart';
import 'notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  final DatabaseService databaseService;
  final NotificationsService notificationsService;
  int current = 0;
  NotificationsRepoImpl({
    required this.databaseService,
    required this.notificationsService,
  });

  @override
  Future<void> showBasicNotification({
    String? title,
    required String body,
    int? id,
  }) async {
    notificationsService.showBasicNotification(
      body: body,
      id: id ?? 0,
      title: title ?? 'تنبيهات الصلاحية',
    );
    await saveNotification(data: body);
  }

  Future<void> saveNotification({required String data}) async {
    var notificationId = const Uuid().v4();

    NotificationsEntity notificationsEntity = NotificationsEntity(
      body: data,
      time: getCurrentTimeWithPeriod(),
      uId: getUser().uId,
      isSeen: false,
      notificationId: notificationId,
      createAt: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        DateTime.now().hour,
        DateTime.now().minute,
      ),
    );
    await databaseService.addData(
      path: BackendEndpoint.notificationsCollection,
      docId: notificationId,
      data: NotificationsModel.fromEntity(notificationsEntity).toMap(),
    );
  }

  @override
  Future<Either<Failure, List<NotificationsEntity>>> getNotifications() async {
    try {
      var data = await databaseService
          .getData(path: BackendEndpoint.notificationsCollection, query: {
        'where': 'uId',
        'isEqualTo': getUser().uId,
        'orderBy': 'createAt',
        'descending': true,
      }) as List<Map<String, dynamic>>;

      List<NotificationsEntity> notifications = data.map((e) {
        seenNotifications(uId: e['notificationId']);
        DateTime createAt = (e['createAt'] as Timestamp).toDate();
        return NotificationsModel.fromJson({...e, 'createAt': createAt});
      }).toList();

      return right(notifications);
    } on CustomException catch (e) {
      log(e.toString());

      return left(ServerFailures(e.message));
    } catch (e) {
      log(e.toString());

      return left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<void> seenNotifications({required String uId}) async {
    await databaseService.updateData(
      path: BackendEndpoint.notificationsCollection,
      uId: uId,
      value: {
        'isSeen': true,
      },
    );
  }
}
