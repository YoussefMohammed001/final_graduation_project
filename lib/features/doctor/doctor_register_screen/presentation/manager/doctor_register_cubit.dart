import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/doctor_register_screen/data/doctor_register_model.dart';
import 'package:final_graduation_project/features/doctor/doctor_register_screen/data/specialized_model.dart';
import 'package:meta/meta.dart';

part 'doctor_register_state.dart';

class DoctorRegisterCubit extends Cubit<DoctorRegisterState> {
  DoctorRegisterCubit() : super(DoctorRegisterInitial());
  DoctorRegisterModel doctorRegisterModel = DoctorRegisterModel();
  List<SpecializedData> specializedData = [];

  doctorRegister({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required int phoneNumber,
    required String specialization,
    required String image,


  }) async {
    emit(DoctorRegisterLoading());
    var response = await AppDio.postFile(endPoint: EndPoints.register,
        formData:FormData.fromMap({
          "name":name,
          "email":email,
          "password":password,
          "phone": phoneNumber,
          "specializeId":specialization,
          "isDoctor" :"true",
          "img" : await MultipartFile.fromFile(image),
        })

    );
    doctorRegisterModel = DoctorRegisterModel.fromJson(response!.data);
    if(doctorRegisterModel.apiStatus ==true){
      safePrint("name>> ${doctorRegisterModel.doctor.name}");
      safePrint(response);
      emit(DoctorRegisterSuccess(doctorRegisterModel.massage));
    } else{
      emit(DoctorRegisterFailure(doctorRegisterModel.massage));
      safePrint(response);

    }

  }














  getSpecialist() async {
    var response = await AppDio.get(endPoint: "specialize/all",);
    try {
      SpecializedModel  specializedModel = SpecializedModel.fromJson(response!.data);
      safePrint(response);
      specializedData = specializedModel.data;
      print(specializedModel.data);
      emit(DoctorRegisterGetSpecializationSuccess());
    } catch(e){

    }
    // ignore: empty_catches

  }
}
