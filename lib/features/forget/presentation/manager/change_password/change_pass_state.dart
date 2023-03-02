part of 'change_pass_cubit.dart';

@immutable
abstract class ChangePassState {}

class ChangePassInitial extends ChangePassState {}
class ChangePassLoading extends ChangePassState {}
class ChangePassSucsess extends ChangePassState {
  final String sucsessMessage;

  ChangePassSucsess(this.sucsessMessage);
}
class ChangePassFailure extends ChangePassState {
  final String failureMessage;
  ChangePassFailure(this.failureMessage);
}
