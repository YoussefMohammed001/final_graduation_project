part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileLogoutSucsess extends ProfileState {
  final String sucsessMessage;

  ProfileLogoutSucsess(this.sucsessMessage);
}
class ProfileLogoutFailure extends ProfileState {

  final String failureMessage;

  ProfileLogoutFailure(this.failureMessage);
}
class ProfileDeleteSucsess extends ProfileState {}
class ProfileDeleteFailure extends ProfileState {}

