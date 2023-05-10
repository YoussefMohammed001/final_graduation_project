import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/data/pending_appointments_model.dart';
import 'package:meta/meta.dart';

part 'doctor_appointments_state.dart';

class DoctorAppointmentsCubit extends Cubit<DoctorAppointmentsState> {
  DoctorAppointmentsCubit() : super(DoctorAppointmentsInitial());
  List<Data> appointments = [];
  getAppointments()  async {
    showLoading();
    var response = await AppDio.get(endPoint: MyShared.getBoolean(key: MySharedKeys.currentAppointment) == true ? EndPoints.nwDoctor+MyShared.getString(key: MySharedKeys.id).toString() :EndPoints.olDoctor+MyShared.getString(key: MySharedKeys.id).toString() );
    PendingAppointmentsModel pendingAppointmentsModel = PendingAppointmentsModel.fromJson(response!.data);
    appointments = pendingAppointmentsModel.data;
    if(pendingAppointmentsModel.apiStatus == true){
      emit(DoctorAppointmentsSuccess());
      safePrint(response.toString());
      hideLoading();
    } else{
      hideLoading();
    }

  }






}
