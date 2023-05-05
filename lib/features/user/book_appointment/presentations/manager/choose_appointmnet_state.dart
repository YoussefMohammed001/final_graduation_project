part of 'choose_appointmnet_cubit.dart';

@immutable
abstract class ChooseAppointmnetState {}

class ChooseAppointmnetInitial extends ChooseAppointmnetState {}
class ChooseAppointmnetSuccess extends ChooseAppointmnetState {}
class ChooseAppointmnetFailure extends ChooseAppointmnetState {}
