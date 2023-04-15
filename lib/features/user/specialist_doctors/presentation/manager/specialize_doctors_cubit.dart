import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/data/specialize_doctors_model.dart';
import 'package:meta/meta.dart';

part 'specialize_doctors_state.dart';

class SpecializeDoctorsCubit extends Cubit<SpecializeDoctorsState> {
  SpecializeDoctorsCubit() : super(SpecializeDoctorsInitial());
  List<SpecializeDoctorData> specializeDoctorData = [];

  getDoctors({required String id}) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.specializeDoctors,
      data: {
      "specializeId":id
      }

    );
    try {
      SpecializeDoctorsModel  specializeDoctorsModel = SpecializeDoctorsModel.fromJson(response!.data);
      specializeDoctorData = specializeDoctorsModel.data;
      emit(SpecializeDoctorsSuccess());
      hideLoading();
    } catch(e){

    }
    // ignore: empty_catches

  }
}
