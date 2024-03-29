import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/splash/data/doctorDataModel.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  DoctorProfileData doctorProfileData = DoctorProfileData();


  getDoctorData() async {
    var response = await AppDio.get(endPoint: "doctor/me",);
    try {
      DoctorDataModel  doctorDataModel = DoctorDataModel.fromJson(response!.data);
      doctorProfileData = doctorDataModel.doctorProfileData;
      if(doctorDataModel.apiStatus == true){
        safePrint(response);
        emit(SplashSucsess(doctorProfileData.status));
      } if(doctorDataModel.apiStatus == false){
        safePrint("fail"+ response.toString());
        emit(SplashFailure());
      }
    } catch(e){
      safePrint("E"+ response.toString());
    emit(SplashFailure());
    }
  }
}
