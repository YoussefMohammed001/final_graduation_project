import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/send_licence/data/clinic_licence_model.dart';
import 'package:meta/meta.dart';

part 'add_practice_licence_state.dart';

class AddPracticeLicenceCubit extends Cubit<AddPracticeLicenceState> {
  AddPracticeLicenceCubit() : super(AddPracticeLicenceInitial());
  ClinicLicenceModel clinicLicenceModel = ClinicLicenceModel();


  addPracticeLicence({
    required String image,
    required String id,
  }) async {
showLoading();
    print("loading");
    var response = await AppDio.postFile(endPoint: EndPoints.addPracticeLicence+id,
      formData: FormData.fromMap({
        "img": await MultipartFile.fromFile(image),
      }),
    );
    try{
      print("loading");
      clinicLicenceModel = ClinicLicenceModel.fromJson(response!.data);
      if(clinicLicenceModel.apiStatus == true){
        hideLoading();
        safePrint("response $response");
        emit(AddPracticeLicenceSucsess(clinicLicenceModel.data.toString()));
      } if(clinicLicenceModel.apiStatus == false){
        safePrint("response $response");
        emit(AddPracticeLicenceFailure(clinicLicenceModel.data.toString()));
      }
    }catch(e){
      emit(AddPracticeLicenceFailure(clinicLicenceModel.data.toString()));
      safePrint("$response");
    }


  }
}
