import 'package:dartz/dartz.dart';

import '../../features/notifications/domin/entites/notifications_entity.dart';
import '../errors/failures.dart';

abstract class NotificationsRepo {
  Future<void> showBasicNotification({
    String? title,
    required String body,
    int? id,
  });
  Future<Either<Failure, List<NotificationsEntity>>> getNotifications();
  Future<void> seenNotifications({required String uId});
}
