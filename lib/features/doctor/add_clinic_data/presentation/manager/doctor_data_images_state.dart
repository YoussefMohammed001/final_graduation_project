part of 'doctor_data_images_cubit.dart';

@immutable
abstract class DoctorDataImagesState {}

class DoctorDataImagesInitial extends DoctorDataImagesState {}
class DoctorDataSuccess extends DoctorDataImagesState {}
class DoctorImagesSuccess extends DoctorDataImagesState {}
class DoctorImagesFailure extends DoctorDataImagesState {
  final String message;

  DoctorImagesFailure(this.message);
}
class DoctorDataFailure extends DoctorDataImagesState {
  final String message;

  DoctorDataFailure(this.message);
}
