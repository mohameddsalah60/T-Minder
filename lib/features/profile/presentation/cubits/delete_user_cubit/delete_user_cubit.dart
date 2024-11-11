import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/profile/domin/repos/profile_repo.dart';

part 'delete_user_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(this.profileRepo) : super(DeleteUserInitial());
  final ProfileRepo profileRepo;
  void deleteAccount() async {
    emit(DeleteUserLoading());
    var result = await profileRepo.deleteAccount();
    result.fold(
      (failure) {
        emit(DeleteUserFailure(message: failure.messages));
      },
      (succsess) {
        emit(DeleteUserSuccses());
      },
    );
  }
}
