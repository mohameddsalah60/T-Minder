part of 'notifications_cubit.dart';

class NotificationsState {}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsFailure extends NotificationsState {
  final String message;

  NotificationsFailure({required this.message});
}

final class NotificationsSuccsess extends NotificationsState {
  final List<NotificationsEntity> notifications;

  NotificationsSuccsess({required this.notifications});
}

final class NoFoundNotifications extends NotificationsState {}
