// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/Authentication/login/data/models/login_doctor_model.dart';
import 'package:final_graduation_project/features/Authentication/login/data/models/login_request_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginRequestModel loginRequestModel = LoginRequestModel();
  LoginDoctorModel loginDoctorModel = LoginDoctorModel();
  List<Img> img = [];
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
     if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == false){
       loginRequestModel = LoginRequestModel.fromJson(response!.data);
       if(loginRequestModel.apiStatus == true) {
         safePrint("name>> ${loginRequestModel.data.userData.profilePicture.url}");
         safePrint(response);
         saveUserData();
         var respones = await AppDio.post(endPoint: "/user/addNotify/${MyShared.getString(key: MySharedKeys.id)}",data: {
           "token":MyShared.getString(key: MySharedKeys.FirebaseToken),

         });
         safePrint("response==>$respones");
         emit(LoginSucsess(loginRequestModel.message,loginRequestModel.data.userData.isverified));
       } else{
         emit(LoginFailure(loginRequestModel.message));
         safePrint(response);
       }
     }
     if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == true){
       loginDoctorModel = LoginDoctorModel.fromJson(response!.data);
       if(loginDoctorModel.apiStatus == true){
         img = loginDoctorModel.doctor.img;
         safePrint(response);
         await saveDoctorData();
         MyShared.putBoolean(key: MySharedKeys.isDoctor, value: true);
         var respones = await AppDio.post(endPoint: "/user/addNotify/${MyShared.getString(key: MySharedKeys.id)}",data: {
           "token":MyShared.getString(key: MySharedKeys.FirebaseToken),

         });
         safePrint("response==>$respones");
         emit(LoginSucsess(loginDoctorModel.message,loginDoctorModel.isDoctor));
       } else{
         emit(LoginFailure(loginDoctorModel.message));
       }
     }



   }catch(e){
     if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == true){
       emit(LoginFailure(loginDoctorModel.message));
       safePrint("====>$e" );
     } else{
       emit(LoginFailure(loginRequestModel.message));
     }
   }

  }






  saveUserData() async {
    MyShared.putString(key:MySharedKeys.email, value:loginRequestModel.data.userData.email);
    MyShared.putString(key: MySharedKeys.username, value:loginRequestModel.data.userData.name);
    MyShared.putString(key: MySharedKeys.apiToken, value:loginRequestModel.data.token);
    MyShared.putString(key: MySharedKeys.patientImage, value:loginRequestModel.data.userData.profilePicture.url);
    MyShared.putString(key: MySharedKeys.id, value:loginRequestModel.data.userData.id);
    MyShared.putInt(key: MySharedKeys.phone, value:loginRequestModel.data.userData.phone.toInt());
    MyShared.putBoolean(key: MySharedKeys.isDoctor, value:loginRequestModel.data.userData.isDoctor);
  }

  saveDoctorData() async {
    MyShared.putString(key: MySharedKeys.username, value:loginDoctorModel.doctor.name);
    MyShared.putString(key:MySharedKeys.apiToken, value:loginDoctorModel.token);
    MyShared.putString(key: MySharedKeys.drNameAr, value: loginDoctorModel.doctor.nameAr);
    MyShared.putString(key: MySharedKeys.patientImage, value: loginDoctorModel.doctor.profilePicture.url);
    MyShared.putString(key: MySharedKeys.id, value: loginDoctorModel.doctor.id);
    MyShared.putString(key: MySharedKeys.drabout, value: loginDoctorModel.doctor.about);
    MyShared.putString(key: MySharedKeys.draboutAr, value: loginDoctorModel.doctor.aboutAr);
    MyShared.putString(key: MySharedKeys.drExperince, value: loginDoctorModel.doctor.experience);
    MyShared.putString(key: MySharedKeys.drWaitingTime, value: loginDoctorModel.doctor.waitingTime);
    MyShared.putString(key: MySharedKeys.drCurrentLocation, value: loginDoctorModel.doctor.geolocation.coordinates.first.toString());
    MyShared.putString(key: MySharedKeys.drAddress, value: loginDoctorModel.doctor.address.city);
    MyShared.putString(key: MySharedKeys.drAddressAR, value: loginDoctorModel.doctor.address.cityAr);
    MyShared.putString(key: MySharedKeys.drPlace, value: loginDoctorModel.doctor.address.placeNumber);
    MyShared.putString(key: MySharedKeys.drPlaceAr, value: loginDoctorModel.doctor.address.placeNumberAr);
     MyShared.putString(key: MySharedKeys.clinicImage1, value: img[0].url);
     MyShared.putString(key: MySharedKeys.clinicImage2, value: img[1].url);
    MyShared.putString(key: MySharedKeys.clinicImage3, value: img[2].url);
    MyShared.putString(key: MySharedKeys.clinicImage4, value: img[3].url);
    MyShared.putString(key: MySharedKeys.clinicImage5, value: img[4].url);
    MyShared.putString(key: MySharedKeys.clinicImageId1, value: img[0].publicId);
    MyShared.putString(key: MySharedKeys.clinicImageId2, value: img[1].publicId);
    MyShared.putString(key: MySharedKeys.clinicImageId3, value: img[2].publicId);
    MyShared.putString(key: MySharedKeys.clinicImageId4, value: img[3].publicId);
    MyShared.putString(key: MySharedKeys.clinicImageId5, value: img[4].publicId);





  }

}

