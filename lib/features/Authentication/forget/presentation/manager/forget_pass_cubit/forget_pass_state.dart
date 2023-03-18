part of 'forget_pass_cubit.dart';

@immutable
abstract class ForgetPassState {}

class ForgetPassInitial extends ForgetPassState {}
class ForgetPassLoading extends ForgetPassState {}
class ForgetPassSendCodeSucsess extends ForgetPassState {
  final String sucsessMessage;

  ForgetPassSendCodeSucsess(this.sucsessMessage);
}
class ForgetPassVerifySucsess extends ForgetPassState {
  final String sucsessMessage;

  ForgetPassVerifySucsess(this.sucsessMessage);
}
class ForgetPassVerifyFailure extends ForgetPassState {
  final String failureMessage;

  ForgetPassVerifyFailure(this.failureMessage);
}
class ForgetPassSendCodeFailure extends ForgetPassState {
  final String failureMessage;
  ForgetPassSendCodeFailure(this.failureMessage);
}
