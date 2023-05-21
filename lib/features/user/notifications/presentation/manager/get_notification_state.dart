part of 'get_notification_cubit.dart';

@immutable
abstract class GetNotificationState {}

class GetNotificationInitial extends GetNotificationState {}
class GetNotificationSuccess extends GetNotificationState {}
class GetNotificationFailure extends GetNotificationState {}
