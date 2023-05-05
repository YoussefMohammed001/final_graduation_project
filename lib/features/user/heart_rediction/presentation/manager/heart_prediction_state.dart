part of 'heart_prediction_cubit.dart';

@immutable
abstract class HeartPredictionState {}

class HeartPredictionInitial extends HeartPredictionState {}
class HeartPredictionSuccess extends HeartPredictionState {
  final String message;

  HeartPredictionSuccess(this.message);
}
class HeartPredictionFailure extends HeartPredictionState {}
