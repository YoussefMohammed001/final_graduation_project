part of 'specialize_doctors_cubit.dart';

@immutable
abstract class SpecializeDoctorsState {}

class SpecializeDoctorsInitial extends SpecializeDoctorsState {}
class SpecializeDoctorsSuccess extends SpecializeDoctorsState {}
class SpecializeDoctorsFailure extends SpecializeDoctorsState {}
