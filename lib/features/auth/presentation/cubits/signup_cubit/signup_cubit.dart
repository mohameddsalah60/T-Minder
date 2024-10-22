import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/auth/domin/entites/user_entity.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());
  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
      phone,
    );
    result.fold(
      (failure) {
        emit(SignupFailure(error: failure.messages));
      },
      (userEntity) {
        emit(SignupSuccses(userEntity: userEntity));
      },
    );
  }
}
