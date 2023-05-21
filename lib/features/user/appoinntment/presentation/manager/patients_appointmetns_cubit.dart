import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/appoinntment/data/patient_appointments_model.dart';
import 'package:meta/meta.dart';

part 'patients_appointmetns_state.dart';

class PatientsAppointmetnsCubit extends Cubit<PatientsAppointmetnsState> {
  PatientsAppointmetnsCubit() : super(PatientsAppointmetnsInitial());
  List<PatientAppointments> patientNewAppointments = [];
  List<PatientAppointments> patientOldAppointments = [];

  getAppointemnts() async {
    showLoading();
    var response = await AppDio.get(
      endPoint: EndPoints.currentAppointment,
    );
    try {
      PatientAppointmentsModel specializeDoctorsModel =
          PatientAppointmentsModel.fromJson(response!.data);
      patientNewAppointments = specializeDoctorsModel.patientAppointments;
    if(specializeDoctorsModel.apiStatus == true){
      emit(PatientsAppointmetnsSucsess());
      safePrint(response);
      hideLoading();

    } else{
      safePrint(response);
hideLoading();
    }
    } catch (e) {
      safePrint(e);
      hideLoading();

    }
  }

  getOld() async {
    showLoading();
    var response = await AppDio.get(
      endPoint: "user/previous-appointment",
    );
    try {
      PatientAppointmentsModel specializeDoctorsModel =
          PatientAppointmentsModel.fromJson(response!.data);
      patientOldAppointments = specializeDoctorsModel.patientAppointments;
      emit(PatientsAppointmetnsSucsess());

      print(response);
      hideLoading();
    } catch (e) {}
  }

  addReview({
    required String patientId,
    required String doctorId,
    required String rate,
  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.addReview, data: {
      "patientId": patientId,
      "doctorId": "643733944955aafd31f2061a",
      "rating": rate
    });
    try {
      safePrint(response);
      hideLoading();
      showSuccess("Your review sent successfully");
    } catch (e) {
      safePrint(e);
    }
  }
}
