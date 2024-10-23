import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmart_expiry_date/features/auth/domin/repos/auth_repo.dart';

part 'select_zone_state.dart';

class SelectZoneCubit extends Cubit<SelectZoneState> {
  SelectZoneCubit(this.authRepo) : super(SelectZoneInitial());
  final AuthRepo authRepo;
  selectZoneUser({required String zone}) {
    emit(SelectZoneLoading());
    try {
      authRepo.selectUserZone(zone: zone);
      emit(SelectZoneSuccses());
    } catch (e) {
      emit(SelectZoneFailure(message: e.toString()));
    }
  }
}
