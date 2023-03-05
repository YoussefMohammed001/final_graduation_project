part of 'forget_pass_cubit.dart';

@immutable
abstract class ForgetPassState {}

class ForgetPassInitial extends ForgetPassState {}
class ForgetPassLoading extends ForgetPassState {}
class ForgetPassSendCodeSucsess extends ForgetPassState {
  final String sucsessMessage;

  ForgetPassSendCodeSucsess(this.sucsessMessage);
}
class ForgetPassSendCodeFailure extends ForgetPassState {
  final String failureMessage;

  ForgetPassSendCodeFailure(this.failureMessage);
}
