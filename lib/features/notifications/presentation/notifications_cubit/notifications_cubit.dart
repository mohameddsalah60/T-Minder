import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/repos/notifications_repo.dart';
import 'package:tmart_expiry_date/features/notifications/domin/entites/notifications_entity.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this.notificationsRepo) : super(NotificationsInitial());
  final NotificationsRepo notificationsRepo;

  seenNotifications({required String uId}) async {
    await notificationsRepo.seenNotifications(uId: uId);
  }

  void getNotifications() async {
    emit(NotificationsLoading());
    var result = await notificationsRepo.getNotifications();
    result.fold(
        (failure) => emit(NotificationsFailure(message: failure.messages)),
        (notifications) {
      if (notifications.isNotEmpty) {
        emit(
          NotificationsSuccsess(notifications: notifications),
        );
      } else {
        emit(NoFoundNotifications());
      }
    });
  }
}
