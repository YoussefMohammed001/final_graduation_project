part of 'contact_us_model_cubit.dart';

@immutable
abstract class ContactUsModelState {}

class ContactUsModelInitial extends ContactUsModelState {}
class ContactUsModelSucsess extends ContactUsModelState {}
class ContactUsModelFailure extends ContactUsModelState {}
