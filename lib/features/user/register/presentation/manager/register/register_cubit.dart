// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/register/data/models/RegisterRequestModel.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
   RegisterRequestModel registerModel = RegisterRequestModel();

  userRegister({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String city,
    required String from,

  }) async {
    emit(PostRegisterLoadingState());
    var response = await AppDio.post(endPoint: EndPoints.register,
        data: {
          "name":name,
          "email":email,
          "password":password,
          "ConfirmPassword":confirmPassword,
          "city":city,
          "from":from,
        });
    registerModel = RegisterRequestModel.fromJson(response!.data);
     if(registerModel.apiStatus ==true){
       safePrint("name>> ${registerModel.data.user.name}");
       safePrint(response);
       emit(PostRegisterSuccessState(registerModel.message));
     } else{
       emit(PostRegisterFailureState(registerModel.message));
       safePrint(response);

     }

  }
}
