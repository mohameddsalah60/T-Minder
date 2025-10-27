part of 'signin_cubit.dart';

class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccses extends SigninState {
  final UserEntity userEntity;

  SigninSuccses({required this.userEntity});
}

final class SigninFailure extends SigninState {
  final String error;

  SigninFailure({required this.error});
}
