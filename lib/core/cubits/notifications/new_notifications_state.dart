part of 'new_notifications_cubit.dart';

@immutable
abstract class NewNotificationsState {}

class NewNotificationsInitial extends NewNotificationsState {}
class NewNotificationsSuccess extends NewNotificationsState {}
class NewNotificationsFailure extends NewNotificationsState {}
