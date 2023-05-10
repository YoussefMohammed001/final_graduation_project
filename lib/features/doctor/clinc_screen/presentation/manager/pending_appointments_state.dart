part of 'pending_appointments_cubit.dart';

@immutable
abstract class PendingAppointmentsState {}

class PendingAppointmentsInitial extends PendingAppointmentsState {}

class PendingAppointmentsSuccess extends PendingAppointmentsState {

  final String message;

  PendingAppointmentsSuccess(this.message);
}

class PendingAppointmentsFailure extends PendingAppointmentsState {

  final String message;

  PendingAppointmentsFailure(this.message);
}
