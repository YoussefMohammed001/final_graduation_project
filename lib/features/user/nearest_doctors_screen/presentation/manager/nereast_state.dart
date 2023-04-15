part of 'nereast_cubit.dart';

@immutable
abstract class NereastState {}

class NereastInitial extends NereastState {}
class NereastSuccess extends NereastState {}
class NereastFailure extends NereastState {}
