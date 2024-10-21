import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;
  SigninCubit(this.authRepo) : super(SigninInitial());

  Future<void> signinUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(
        SigninFailure(error: failure.messages),
      ),
      (userEntity) => emit(
        SigninSuccses(userEntity: userEntity),
      ),
    );
  }

  Future<void> signinUserWithGoogle() async {
    emit(SigninLoading());
    final result = await authRepo.signinUserWithGoogle();
    result.fold(
      (failure) => emit(
        SigninFailure(error: failure.messages),
      ),
      (userEntity) => emit(
        SigninSuccses(userEntity: userEntity),
      ),
    );
  }
}
