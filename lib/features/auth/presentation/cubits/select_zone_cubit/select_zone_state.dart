part of 'select_zone_cubit.dart';

sealed class SelectZoneState {}

final class SelectZoneInitial extends SelectZoneState {}

final class SelectZoneLoading extends SelectZoneState {}

final class SelectZoneSuccses extends SelectZoneState {}

final class SelectZoneFailure extends SelectZoneState {
  final String message;

  SelectZoneFailure({required this.message});
}
