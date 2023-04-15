// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/Authentication/login/data/models/login_request_model.dart';
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
       safePrint("name>> ${loginRequestModel.data.userData.profilePicture.url}");
       safePrint(response);
       await saveUserData();
       emit(LoginSucsess(loginRequestModel.message,loginRequestModel.data.userData.isverified,loginRequestModel.data.userData.isDoctor));
     } if(loginRequestModel.apiStatus == false){
       emit(LoginFailure(loginRequestModel.message));
       safePrint(response);
     }
   }catch(e){
     emit(LoginFailure(loginRequestModel.message));
     safePrint("${response}e");
   }

  }

  saveUserData() async {

    MyShared.putString(key:MySharedKeys.email, value:loginRequestModel.data.userData.email);
    MyShared.putString(key: MySharedKeys.username, value:loginRequestModel.data.userData.name);
    MyShared.putString(key: MySharedKeys.apiToken, value:loginRequestModel.data.token);
    MyShared.putString(key: MySharedKeys.patientImage, value:loginRequestModel.data.userData.profilePicture.url);
    MyShared.putString(key: MySharedKeys.id, value:loginRequestModel.data.userData.id);
    MyShared.putInt(key: MySharedKeys.phone, value:loginRequestModel.data.userData.phone.toInt());
  }

}
