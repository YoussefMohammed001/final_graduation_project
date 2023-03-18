part of 'verify_cubit.dart';

@immutable
abstract class VerifyState {}

class VerifyInitial extends VerifyState {}
class VerifyLoading extends VerifyState {}
class VerifySucsess extends VerifyState {
  final String sucsessMessage;

  VerifySucsess(this.sucsessMessage);
}
class VerifyFailure extends VerifyState {
  final String errorMessage;

  VerifyFailure(this.errorMessage);
}
