part of 'doctor_appointments_cubit.dart';

@immutable
abstract class DoctorAppointmentsState {}

class DoctorAppointmentsInitial extends DoctorAppointmentsState {}
class DoctorAppointmentsSuccess extends DoctorAppointmentsState {}
class DoctorAppointmentsFailure extends DoctorAppointmentsState {}
