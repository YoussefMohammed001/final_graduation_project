// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/Authentication/register/data/models/User_register_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  UserRegisterModel userRegisterRequestModel = UserRegisterModel();

  userRegister({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required int phoneNumber,
  }) async {
    emit(PostRegisterLoadingState());
    var response = await AppDio.post(endPoint: EndPoints.register, data: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phoneNumber,
      "ConfirmPassword": confirmPassword,
    });
    userRegisterRequestModel = UserRegisterModel.fromJson(response!.data);
    if (userRegisterRequestModel.apiStatus == true) {
      safePrint("name>> ${userRegisterRequestModel.data.patient.name}");
      safePrint(response);
      emit(PostRegisterSuccessState(userRegisterRequestModel.massage));
    } else {
      emit(PostRegisterFailureState(userRegisterRequestModel.massage));
      safePrint(response);
    }
  }
}
