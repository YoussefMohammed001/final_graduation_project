part of 'add_working_hours_cubit.dart';

@immutable
abstract class AddWorkingHoursState {}

class AddWorkingHoursInitial extends AddWorkingHoursState {}
class AddWorkingHoursSuccess extends AddWorkingHoursState {}
class AddWorkingHoursFailure extends AddWorkingHoursState {}
