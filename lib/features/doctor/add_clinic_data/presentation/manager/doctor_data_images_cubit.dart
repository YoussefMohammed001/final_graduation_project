// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/data/add_doctor_data_model.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/data/clinic_images_model.dart';
import 'package:final_graduation_project/features/doctor/clinic_data/data/update_doctor_images_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'doctor_data_images_state.dart';

class DoctorDataImagesCubit extends Cubit<DoctorDataImagesState> {
  DoctorDataImagesCubit() : super(DoctorDataImagesInitial());
  AddDoctorDataModel addDoctorData = AddDoctorDataModel();
  ClinicImagesModel addClinicImagesModel = ClinicImagesModel();
  List<Img> img = [];
  UpdateDoctorImagesModel updateDoctorImagesModel = UpdateDoctorImagesModel();
List<UpdatedData> dataImages = [];



  addDoctorDataa({
     String? name,
     String? lat,
     String? lon,
     String? about,
     String? aboutAR,
     String? waitingTime,
     String? cityAR,
     String? city,
     String? placeNOAr,
     String? placeNO,
     String? fees,
     String? experience,
     required String id,
  }) async {
    showLoading();
    try {
      var response =
          await AppDio.post(endPoint: EndPoints.addDoctorData + id, data: {
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

      addDoctorData = AddDoctorDataModel.fromJson(response!.data);
      if (addDoctorData.apiStatus == true) {
        safePrint("message");
        safePrint("name>> ${addDoctorData.data.about}");
        safePrint("====> ${response}");
        saveDoctorData();
        hideLoading();
        safePrint(MyShared.getString(key: MySharedKeys.drNameAr));
        emit(DoctorDataSuccess());
      } else if (addDoctorData.apiStatus == false) {
        safePrint("x");

        emit(DoctorDataFailure(addDoctorData.message));
        safePrint("error");
      }
    } catch (e) {
      emit(DoctorDataFailure(e.toString()));
      safePrint("+$e");
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
      addClinicImagesModel = ClinicImagesModel.fromJson(response!.data);
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
      safePrint("$e");
    }
  }


  updateClincImages({required String imgId,required String img}) async {
    showLoading();
    var response = await AppDio.postFile(endPoint: EndPoints.updateImages+MyShared.getString(key: MySharedKeys.id),
    formData: FormData.fromMap({
      "imgId" : imgId,
      "img" : await MultipartFile.fromFile(img),

    })
    );
    updateDoctorImagesModel = UpdateDoctorImagesModel.fromJson(response!.data);
    dataImages = updateDoctorImagesModel.data;
    await updateImages();
    emit(DoctorImagesSuccess());
    hideLoading();
    safePrint(response.toString());

  }
  saveDoctorData() {
    MyShared.putString(
        key: MySharedKeys.drNameAr, value: addDoctorData.data.nameAr);
    MyShared.putString(
        key: MySharedKeys.drabout, value: addDoctorData.data.about);
    MyShared.putString(
        key: MySharedKeys.draboutAr, value: addDoctorData.data.aboutAr);
    MyShared.putString(
        key: MySharedKeys.drExperince, value: addDoctorData.data.experience);
    MyShared.putString(
        key: MySharedKeys.drWaitingTime, value: addDoctorData.data.waitingTime);
    MyShared.putString(
        key: MySharedKeys.drAddress, value: addDoctorData.data.address.city);
    MyShared.putString(
        key: MySharedKeys.drAddressAR,
        value: addDoctorData.data.address.cityAr);
    MyShared.putString(
        key: MySharedKeys.drPlace,
        value: addDoctorData.data.address.placeNumber);
    MyShared.putString(
        key: MySharedKeys.drPlaceAr,
        value: addDoctorData.data.address.placeNumberAr);
  }

  saveUserImages() {
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


  updateImages() {
    MyShared.putString(key: MySharedKeys.clinicImage1, value: dataImages[0].url);
    MyShared.putString(key: MySharedKeys.clinicImage2, value: dataImages[1].url);
    MyShared.putString(key: MySharedKeys.clinicImage3, value: dataImages[2].url);
    MyShared.putString(key: MySharedKeys.clinicImage4, value: dataImages[3].url);
    MyShared.putString(key: MySharedKeys.clinicImage5, value: dataImages[4].url);

    MyShared.putString(key: MySharedKeys.clinicImageId1, value: dataImages[0].id);
    MyShared.putString(key: MySharedKeys.clinicImageId2, value: dataImages[1].id);
    MyShared.putString(key: MySharedKeys.clinicImageId3, value: dataImages[2].id);
    MyShared.putString(key: MySharedKeys.clinicImageId4, value: dataImages[3].id);
    MyShared.putString(key: MySharedKeys.clinicImageId5, value: dataImages[4].id);
  }
}
