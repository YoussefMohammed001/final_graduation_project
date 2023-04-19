part of 'add_practice_licence_cubit.dart';

@immutable
abstract class AddPracticeLicenceState {}

class AddPracticeLicenceInitial extends AddPracticeLicenceState {}
class AddPracticeLicenceSucsess extends AddPracticeLicenceState {
  final String message;

  AddPracticeLicenceSucsess(this.message);
}
class AddPracticeLicenceFailure extends AddPracticeLicenceState {
  final String  message;

  AddPracticeLicenceFailure(this.message);
}
