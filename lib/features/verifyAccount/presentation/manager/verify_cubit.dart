// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/verifyAccount/data/models/VerifyAccountMdel.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  VerifyAccountModel verifyAccountModel = VerifyAccountModel();


  userVerify({
    required int code,


  }) async {
    emit(VerifyLoading());
    var response = await AppDio.post(endPoint: "verify",
        data: {
          "code":code,
        });
    verifyAccountModel = VerifyAccountModel.fromJson(response!.data);
    if(verifyAccountModel.apiStatus ==true){
      safePrint(response);
      emit(VerifySucsess(verifyAccountModel.message));
    } else{
      emit(VerifyFailure(verifyAccountModel.message));
      safePrint(response);
    }

  }
}
