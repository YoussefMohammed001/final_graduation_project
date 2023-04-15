import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/single_doctor/data/single_doctor_model.dart';
import 'package:meta/meta.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  DoctorData singleDoctorData = DoctorData();
  List<Img> img = [];


  getSingleDoctorData({required String id}) async {
    showLoading();
    var response = await AppDio.get(endPoint: "doctor/all/$id",);
    try {
      SingleDoctorModel  singleDoctorModel = SingleDoctorModel.fromJson(response!.data);
      img = singleDoctorModel.doctorData.img;
      singleDoctorData = singleDoctorModel.doctorData;
      safePrint(response);
      print(img.length);
      emit(DoctorSuccess());
      hideLoading();
    } catch(e){

    }
  }

}
