part of 'diabetes_cubit.dart';

@immutable
abstract class DiabetesState {}

class DiabetesInitial extends DiabetesState {}
class DiabetesSuccess extends DiabetesState {
  final String message;

  DiabetesSuccess(this.message);
}
class DiabetesFailure extends DiabetesState {
  final String message;

  DiabetesFailure(this.message);
}
