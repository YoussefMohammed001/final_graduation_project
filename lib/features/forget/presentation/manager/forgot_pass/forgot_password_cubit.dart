// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/forget/data/models/ForgotPassModel.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());
ForgotPassModel forgotPassModel = ForgotPassModel();



  userForgotPass({
    required String email,
  }) async {
    emit(ForgotPasswordLoading());
    var response = await AppDio.post(endPoint: "forgotPass",
        data: {
          "email":email,

        });
    forgotPassModel = ForgotPassModel.fromJson(response!.data);
    if(forgotPassModel.apiStatus ==true){
      safePrint("name>> ${forgotPassModel.message}");
      safePrint(response);
      emit(ForgotPasswordSucsess(forgotPassModel.message));
    } else{
      emit(ForgotPasswordFailure(forgotPassModel.message));
      safePrint(response);

    }

  }
}
