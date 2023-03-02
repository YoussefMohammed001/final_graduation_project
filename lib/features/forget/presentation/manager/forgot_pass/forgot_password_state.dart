part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}
class ForgotPasswordLoading extends ForgotPasswordState {

}
class ForgotPasswordSucsess extends ForgotPasswordState {
  final String sucsessMessage;

  ForgotPasswordSucsess(this.sucsessMessage);
}
class ForgotPasswordFailure extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordFailure(this.errorMessage);
}
