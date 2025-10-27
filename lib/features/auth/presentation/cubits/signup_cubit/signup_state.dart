part of 'signup_cubit.dart';

class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccses extends SignupState {
  final UserEntity userEntity;

  SignupSuccses({required this.userEntity});
}

final class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error});
}
