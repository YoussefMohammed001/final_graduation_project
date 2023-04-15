part of 'doctor_cubit.dart';

@immutable
abstract class DoctorState {}

class DoctorInitial extends DoctorState {}
class DoctorSuccess extends DoctorState {}
class DoctorFailure extends DoctorState {}
