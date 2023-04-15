part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}
class SplashSucsess extends SplashState {
  final String pending;

  SplashSucsess(this.pending);
}
class SplashFailure extends SplashState {}
