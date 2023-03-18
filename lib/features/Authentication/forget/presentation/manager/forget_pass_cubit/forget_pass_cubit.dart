// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/features/Authentication/forget/data/models/ForgetPassModel.dart';
import 'package:final_graduation_project/features/Authentication/forget/data/models/verify_pass_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());
  ForgetPassModel forgetPassModel = ForgetPassModel();
  VerifyPassModel verifyPassModel = VerifyPassModel();
  
  sendCode({required String email}) async {
    emit(ForgetPassLoading());
    var response = await AppDio.post(endPoint: EndPoints.forgotPass,
        data: {
        "email":email,
        }
    );
    forgetPassModel = ForgetPassModel.fromJson(response!.data);
    if(forgetPassModel.apiStatus == true){
      emit(ForgetPassSendCodeSucsess(forgetPassModel.message));
    }else{
      emit(ForgetPassSendCodeFailure(forgetPassModel.message));
    }
  }

  changePass({required String otp, required String password}) async{
    emit(ForgetPassLoading());
    var response = await AppDio.post(endPoint: EndPoints.passwordVerify,
        data: {
          "randomString":otp,
          "password" : password,
        }
    );
    verifyPassModel = VerifyPassModel.fromJson(response!.data);
    if(verifyPassModel.apiStatus == true){
      emit(ForgetPassVerifySucsess(verifyPassModel.message));
    }else{
      emit(ForgetPassVerifyFailure(verifyPassModel.message));
    }
    

}
}
