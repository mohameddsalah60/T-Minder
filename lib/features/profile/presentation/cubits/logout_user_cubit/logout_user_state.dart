part of 'logout_user_cubit.dart';

class LogoutUserState {}

final class LogoutUserInitial extends LogoutUserState {}

final class LogoutUserLoading extends LogoutUserState {}

final class LogoutUserSuccses extends LogoutUserState {}

final class LogoutUserFailure extends LogoutUserState {
  final String message;

  LogoutUserFailure({required this.message});
}
