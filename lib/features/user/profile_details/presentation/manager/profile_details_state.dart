part of 'profile_details_cubit.dart';


abstract class ProfileDetailsState {}

class ProfileDetailsInitial extends ProfileDetailsState {}
class ProfileDetailsLoading extends ProfileDetailsState {}
class ProfileDetailsChangePassSuccess extends ProfileDetailsState {
  final String sucsessMessage;
  ProfileDetailsChangePassSuccess(this.sucsessMessage);
}
class ProfileDetailsChangePassFailure extends ProfileDetailsState {
  final String failureMessage;
  ProfileDetailsChangePassFailure(this.failureMessage);
}

class ProfileDeleteSuccess extends ProfileDetailsState {
  final String sucsessMessage;
  ProfileDeleteSuccess(this.sucsessMessage);
}
class ProfileDeleteFailure extends ProfileDetailsState {
  final String failureMessage;
  ProfileDeleteFailure(this.failureMessage);
}

class UpdateUserDataSuccess extends ProfileDetailsState{
  final String message;

  UpdateUserDataSuccess(this.message);
}

class UpdateUserDataFailure extends ProfileDetailsState{
  final String errorMessage;

  UpdateUserDataFailure(this.errorMessage);
}
class UploadUserImageSuccess extends ProfileDetailsState {
  final String successMessage;

  UploadUserImageSuccess(this.successMessage);
}
class UploadUserImageFailure extends ProfileDetailsState {
  final String failureMessage;
  UploadUserImageFailure(this.failureMessage);
}
