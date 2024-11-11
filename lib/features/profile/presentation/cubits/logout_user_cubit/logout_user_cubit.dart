import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/repos/profile_repo.dart';

part 'logout_user_state.dart';

class LogoutUserCubit extends Cubit<LogoutUserState> {
  LogoutUserCubit(this.profileRepo) : super(LogoutUserInitial());
  final ProfileRepo profileRepo;
  void logoutAccount() async {
    emit(LogoutUserLoading());
    var result = await profileRepo.logoutAccount();
    result.fold(
      (failure) {
        emit(LogoutUserFailure(message: failure.messages));
      },
      (succsess) {
        emit(LogoutUserSuccses());
      },
    );
  }
}
