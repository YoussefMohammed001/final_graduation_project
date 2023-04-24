// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/data/addDoctorData.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/data/add_clinic_images_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'doctor_data_images_state.dart';

class DoctorDataImagesCubit extends Cubit<DoctorDataImagesState> {
  DoctorDataImagesCubit() : super(DoctorDataImagesInitial());
  AddDoctorData addDoctorData = AddDoctorData();
  AddClinicImagesModel addClinicImagesModel = AddClinicImagesModel();


  addDoctorDataa({
    required String name,
    required String lat,
    required String lon,
    required String about,
    required String aboutAR,
    required String waitingTime,
    required String cityAR,
    required String city,
    required String placeNOAr,
    required String placeNO,
    required String fees,
    required String experience,

  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData,
        data: {

          "name_ar": name,
          "lat":lat,
          "lon":lon,
          "type":"Point",
          "about": about,
        "about_ar": aboutAR,
          "experience":experience,
          "feesPerCunsaltation": fees,
          "waitingTime": waitingTime,
          "city_ar":cityAR,
          "placeNumber":placeNO,
          "city": city,
          "placeNumber_ar": placeNOAr



        });
    try{

      addDoctorData = AddDoctorData.fromJson(response!.data);
      if(addDoctorData.apiStatus ==true){
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveUserData();
        emit(DoctorDataSuccess());
      } if(addDoctorData.apiStatus == false){
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    }catch(e){
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }

  }


  addPracticeLicence({
    required String image,
    required String image2,
    required String image3,
    required String image4,
    required String image5,
    required String id,
  }) async {
    showLoading();
    safePrint("loading");
    var response = await AppDio.postFile(endPoint: EndPoints.clinicImg,
      formData: FormData.fromMap({
        "img": [
          await MultipartFile.fromFile(image),
          await MultipartFile.fromFile(image2),
          await MultipartFile.fromFile(image3),
          await MultipartFile.fromFile(image4),
          await MultipartFile.fromFile(image5),
        ],
      "doctorId" : id
      }),

    );
    try{
      safePrint("loading");
      addClinicImagesModel = AddClinicImagesModel.fromJson(response!.data);
      if(addClinicImagesModel.apiStatus == true){
        hideLoading();
        safePrint("response $response");
        emit(DoctorImagesSuccess());
      } if(addClinicImagesModel.apiStatus == false){
        safePrint("response $response");
        emit(DoctorImagesFailure(addClinicImagesModel.message));
      }
    }catch(e){
      emit(DoctorImagesFailure(addClinicImagesModel.message));
      safePrint("$response");
    }


  }




  saveUserData() async {

  }

}
