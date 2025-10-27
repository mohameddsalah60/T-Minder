part of 'forget_password_cubit.dart';

class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccses extends ForgetPasswordState {}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String message;

  ForgetPasswordFailure({required this.message});
}
