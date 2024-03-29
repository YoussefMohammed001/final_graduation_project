// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/data/models/doctor_verify_accoount_model.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/data/models/verify_account_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'verify_state.dart';




class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());
  VerifyAccountModel verifyAccountModel = VerifyAccountModel();
  DoctorVerifyAccoountModel doctorVerifyAccoountModel = DoctorVerifyAccoountModel();

  userVerify({
    required int code,


  }) async {
    emit(VerifyLoading());
    var response = await AppDio.post(endPoint: EndPoints.verify,
        data: {
          "code":code,
        });
if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == false){
  verifyAccountModel = VerifyAccountModel.fromJson(response!.data);
  if(verifyAccountModel.apiStatus ==true){
    safePrint(response);
    await saveUserData();
    emit(VerifySucsess(verifyAccountModel.message));
  } else{
    emit(VerifyFailure(verifyAccountModel.message));
    safePrint(response);
  }
}

if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == true) {
  doctorVerifyAccoountModel = DoctorVerifyAccoountModel.fromJson(response!.data);
  if(doctorVerifyAccoountModel.apiStatus ==true){
    safePrint(response);
    MyShared.putString(key: MySharedKeys.apiToken, value: doctorVerifyAccoountModel.data.token);
    MyShared.putString(key: MySharedKeys.id, value: doctorVerifyAccoountModel.data.doctor.id);

    emit(VerifySucsess(doctorVerifyAccoountModel.message));
  } else{
    emit(VerifyFailure(doctorVerifyAccoountModel.message));
    safePrint(response);
  }
}
  }

  saveUserData() async {
    MyShared.putString(key:MySharedKeys.email, value:verifyAccountModel.data.user.email);
    MyShared.putString(key: MySharedKeys.username, value:verifyAccountModel.data.user.name);
     MyShared.putString(key: MySharedKeys.apiToken, value:verifyAccountModel.data.token);
    MyShared.putString(key: MySharedKeys.id, value:verifyAccountModel.data.user.id);
    MyShared.putInt(key: MySharedKeys.phone, value:verifyAccountModel.data.user.phone);
  }

}
