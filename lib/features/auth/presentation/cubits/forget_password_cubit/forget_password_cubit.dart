import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/core/errors/custom_exception.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;
  Future<void> sendPasswordResetEmail({required String email}) async {
    emit(ForgetPasswordLoading());
    try {
      await authRepo.sendPasswordResetEmail(email);
      emit(ForgetPasswordSuccses());
    } on CustomException catch (e) {
      emit(
        ForgetPasswordFailure(message: e.message),
      );
    } catch (e) {
      emit(
        ForgetPasswordFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
