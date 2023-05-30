part of 'skin_cancer_cubit.dart';

@immutable
abstract class SkinCancerState {}

class SkinCancerInitial extends SkinCancerState {}
class SkinCancerLoad extends SkinCancerState {}
class SkinCancerSuccess extends SkinCancerState {}
class SkinCancerFailure extends SkinCancerState {}
