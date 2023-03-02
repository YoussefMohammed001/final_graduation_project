import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/login/data/models/LoginReqestModel.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginRequestModel loginRequestModel = LoginRequestModel();

  userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var response = await AppDio.post(endPoint: "login",
        data: {
      "email":email,
          "password":password,

        });
    loginRequestModel = LoginRequestModel.fromJson(response!.data);
    if(loginRequestModel.apiStatus ==true){
      safePrint("name>> ${loginRequestModel.data.userData.name}");
      safePrint(response);
      emit(LoginSucsess(loginRequestModel.message,loginRequestModel.data.userData.isverified));
    } else{
      emit(LoginFailure(loginRequestModel.message));
      safePrint(response);

    }

  }
}
