// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/Authentication/login/data/models/LoginRequestModel.dart';
// ignore: depend_on_referenced_packages
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
    var response = await AppDio.post(endPoint: EndPoints.login,
        data: {
          "email":email,
          "password":password,


        });
   try{

     loginRequestModel = LoginRequestModel.fromJson(response!.data);
     if(loginRequestModel.apiStatus ==true){
       safePrint("name>> ${loginRequestModel.data.userData.name}");
       safePrint(response);
       await saveUserData();
       emit(LoginSucsess(loginRequestModel.message,loginRequestModel.data.userData.isverified));
     } if(loginRequestModel.apiStatus == false){
       emit(LoginFailure(loginRequestModel.message));
       safePrint(response.statusMessage);
     }
   }catch(e){
     emit(LoginFailure(loginRequestModel.message));
     safePrint("${response!.data}e");
   }

  }

  saveUserData() async {

    MyShared.putString(key:MySharedKeys.email, value:loginRequestModel.data.userData.email);
    MyShared.putString(key: MySharedKeys.username, value:loginRequestModel.data.userData.name);
    MyShared.putString(key: MySharedKeys.apiToken, value:loginRequestModel.data.token);
    MyShared.putString(key: MySharedKeys.from, value:loginRequestModel.data.userData.from);
    MyShared.putString(key: MySharedKeys.city, value:loginRequestModel.data.userData.city);
    MyShared.putString(key: MySharedKeys.id, value:loginRequestModel.data.userData.id);
  }

}
