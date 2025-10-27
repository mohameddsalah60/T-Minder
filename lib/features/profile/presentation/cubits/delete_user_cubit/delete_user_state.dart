part of 'delete_user_cubit.dart';

class DeleteUserState {}

final class DeleteUserInitial extends DeleteUserState {}

final class DeleteUserLoading extends DeleteUserState {}

final class DeleteUserSuccses extends DeleteUserState {}

final class DeleteUserFailure extends DeleteUserState {
  final String message;

  DeleteUserFailure({required this.message});
}
