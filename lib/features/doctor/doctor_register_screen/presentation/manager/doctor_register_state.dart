part of 'doctor_register_cubit.dart';

@immutable
abstract class DoctorRegisterState {}

class DoctorRegisterInitial extends DoctorRegisterState {}
class DoctorRegisterLoading extends DoctorRegisterState {}
class DoctorRegisterSuccess extends DoctorRegisterState {
  final String message;

  DoctorRegisterSuccess(this.message);
}
class DoctorRegisterFailure extends DoctorRegisterState {
  final String message;

  DoctorRegisterFailure(this.message);
}
class DoctorRegisterGetSpecializationSuccess extends DoctorRegisterState {

}
class DoctorRegisterGetSpecializationFailure extends DoctorRegisterState {

}
