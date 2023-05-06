import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/features/user/appoinntment/data/patient_appointments_model.dart';
import 'package:meta/meta.dart';

part 'patients_appointmetns_state.dart';

class PatientsAppointmetnsCubit extends Cubit<PatientsAppointmetnsState> {
  PatientsAppointmetnsCubit() : super(PatientsAppointmetnsInitial());
  List<PatientAppointments> patientAppointments = [];

  getAppointemnts() async {
    showLoading();
    var response = await AppDio.get(endPoint:MyShared.getBoolean(key: MySharedKeys.currentAppointment) == true ? EndPoints.currentAppointment : "user/previous-appointment",


    );
    try {
      PatientAppointmentsModel  specializeDoctorsModel = PatientAppointmentsModel.fromJson(response!.data);
      patientAppointments = specializeDoctorsModel.patientAppointments;
      emit(PatientsAppointmetnsSucsess());
      print(response);
      hideLoading();
    } catch(e){

    }
  }



}
