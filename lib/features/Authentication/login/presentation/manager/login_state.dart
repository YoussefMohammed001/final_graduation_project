part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSucsess extends LoginState {
  final bool verified;
  final bool isDoctor;
  final String sucsessMessage;

  LoginSucsess(this.sucsessMessage, this.verified, this.isDoctor);
}
class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);

}
