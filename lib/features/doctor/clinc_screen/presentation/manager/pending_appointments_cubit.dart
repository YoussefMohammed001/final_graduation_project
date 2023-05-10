import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/data/pending_appointments_model.dart';
import 'package:meta/meta.dart';

part 'pending_appointments_state.dart';

class PendingAppointmentsCubit extends Cubit<PendingAppointmentsState> {
  PendingAppointmentsCubit() : super(PendingAppointmentsInitial());
  List<Data> pendingAppointments = [];
getAppointments()  async {
  showLoading();
  var response = await AppDio.get(endPoint: EndPoints.pending+MyShared.getString(key: MySharedKeys.id).toString());
  PendingAppointmentsModel pendingAppointmentsModel = PendingAppointmentsModel.fromJson(response!.data);
  pendingAppointments = pendingAppointmentsModel.data;
  if(pendingAppointmentsModel.apiStatus == true){
    emit(PendingAppointmentsSuccess("message"));

    safePrint(response.toString());
    hideLoading();
  } else{
    hideLoading();
  }

}


changeStatus({required String id,required String status}) async {
  var response = AppDio.post(endPoint: "doctor/changeAppointmentStatus/$id",data: {
    "status":status
  });
  safePrint(response.toString());
}






}
