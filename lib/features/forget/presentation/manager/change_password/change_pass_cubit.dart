// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/forget/data/models/ChangePassModel.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());
  ChangePassModel changePassModel = ChangePassModel();
  userChangePass({
    required String code,
    required String password
  }) async {
    emit(ChangePassLoading());
    var response = await AppDio.post(endPoint: "passwordVerify",
        data: {
            "randomString":code,
            "password":password
        });
    changePassModel = ChangePassModel.fromJson(response!.data);
    if(changePassModel.apiStatus == true){
      safePrint("name>> ${changePassModel.message}");
      safePrint(response);
      emit(ChangePassSucsess(changePassModel.message));
    } else{
      emit(ChangePassFailure(changePassModel.message));
      safePrint(response);

    }

  }
}
