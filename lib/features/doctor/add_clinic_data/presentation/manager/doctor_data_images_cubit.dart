// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
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
  List<Img> img = [];

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
    required String id,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+id, data: {
      "name_ar": name,
      "lat": lat,
      "lon": lon,
      "type": "Point",
      "about": about,
      "about_ar": aboutAR,
      "experience": experience,
      "feesPerCunsaltation": fees,
      "waitingTime": waitingTime,
      "city_ar": cityAR,
      "placeNumber": placeNO,
      "city": city,
      "placeNumber_ar": placeNOAr
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorNameAr({
    required String name,



  }) async {
    showLoading();

    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "name_ar": name,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorNameAbout({
    required String about,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+ MyShared.getString(key: MySharedKeys.id), data: {
      "about": about,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorNameAboutAr({
    required String aboutAr,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "about_ar": aboutAr,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorLocation({
    required String lat,
    required String lon,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "lat": lat,
      "lon": lon,
      "type": "Point",
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorWaitingTime({waitingTime}) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "waitingTime": waitingTime,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorCityAR({
    required String cityAR,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "city_ar": cityAR,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorCity({
    required String city,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "city": city,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorPlaceNOAr({placeNOAr}) async {
    showLoading();
    var response = await AppDio.post(
        endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {"placeNumber_ar": placeNOAr});
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorPlaceNO({placeNO}) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "placeNumber": placeNO,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorFees({
    required String fees,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "feesPerCunsaltation": fees,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  updateDoctorExperience({
    required String experience,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addDoctorData+MyShared.getString(key: MySharedKeys.id), data: {
      "experience": experience,
    });
    try {
      addDoctorData = AddDoctorData.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("name>> ${addDoctorData.doctorData.userId}");
        safePrint(response);
        await saveDoctorData();
        emit(DoctorDataSuccess());
      }
      if (addDoctorData.apiStatus == false) {
        emit(DoctorDataFailure(addDoctorData.message));
        safePrint(response);
      }
    } catch (e) {
      emit(DoctorDataFailure(addDoctorData.message));
      safePrint("${response}e");
    }
  }

  addClinicImages({
    required String image,
    required String image2,
    required String image3,
    required String image4,
    required String image5,
    required String id,
  }) async {
    showLoading();
    safePrint("loading");
    var response = await AppDio.postFile(
      endPoint: EndPoints.clinicImg,
      formData: FormData.fromMap({
        "img": [
          await MultipartFile.fromFile(image),
          await MultipartFile.fromFile(image2),
          await MultipartFile.fromFile(image3),
          await MultipartFile.fromFile(image4),
          await MultipartFile.fromFile(image5),
        ],
        "doctorId": id
      }),
    );
    try {
      safePrint("loading");
      addClinicImagesModel = AddClinicImagesModel.fromJson(response!.data);
      if (addClinicImagesModel.apiStatus == true) {
        img = addClinicImagesModel.data.img;
        hideLoading();
        safePrint("response $response");
        await saveUserImages();
        emit(DoctorImagesSuccess());
      }
      if (addClinicImagesModel.apiStatus == false) {
        safePrint("response $response");
        emit(DoctorImagesFailure(addClinicImagesModel.message));
      }
    } catch (e) {
      emit(DoctorImagesFailure(addClinicImagesModel.message));
      safePrint("$response");
    }
  }



updateClinicImages(){

}


  saveDoctorData() async {
    MyShared.putString(key: MySharedKeys.drNameAr, value: addDoctorData.doctorData.nameAr);
    MyShared.putString(key: MySharedKeys.drabout, value: addDoctorData.doctorData.about);
    MyShared.putString(key: MySharedKeys.draboutAr, value: addDoctorData.doctorData.aboutAr);
    MyShared.putString(key: MySharedKeys.drExperince, value: addDoctorData.doctorData.experience);
    MyShared.putString(key: MySharedKeys.drWaitingTime, value: addDoctorData.doctorData.waitingTime);
    MyShared.putString(key: MySharedKeys.drCurrentLocation, value: addDoctorData.doctorData.geolocation.coordinates!.first.toString());
    MyShared.putString(key: MySharedKeys.drAddress, value: addDoctorData.doctorData.address.city);
    MyShared.putString(key: MySharedKeys.drAddressAR, value: addDoctorData.doctorData.address.cityAr);
    MyShared.putString(key: MySharedKeys.drPlace, value: addDoctorData.doctorData.address.placeNumber);
    MyShared.putString(key: MySharedKeys.drPlaceAr, value: addDoctorData.doctorData.address.placeNumberAr);

  }

  saveUserImages() async {
    MyShared.putString(key: MySharedKeys.clinicImage1, value: img[0].url);
    MyShared.putString(key: MySharedKeys.clinicImage2, value: img[1].url);
    MyShared.putString(key: MySharedKeys.clinicImage3, value: img[2].url);
    MyShared.putString(key: MySharedKeys.clinicImage4, value: img[3].url);
    MyShared.putString(key: MySharedKeys.clinicImage5, value: img[4].url);
  }
}
