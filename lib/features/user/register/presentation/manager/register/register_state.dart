part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}


class PostRegisterSuccessState extends RegisterState{
final String sucssesMessage;

  PostRegisterSuccessState(this.sucssesMessage);

}
class PostRegisterLoadingState extends RegisterState{

}

class PostRegisterFailureState extends RegisterState{
  final String errorMessage;
  PostRegisterFailureState(this.errorMessage);
}