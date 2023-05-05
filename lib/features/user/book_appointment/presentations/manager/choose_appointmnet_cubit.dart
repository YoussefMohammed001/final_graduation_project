
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/features/user/book_appointment/data/models/ConfirmAppoinmtnetModel.dart';
import 'package:final_graduation_project/features/user/book_appointment/data/models/choose_appointment_model.dart';
import 'package:meta/meta.dart';

part 'choose_appointmnet_state.dart';

class ChooseAppointmnetCubit extends Cubit<ChooseAppointmnetState> {
  ChooseAppointmnetCubit() : super(ChooseAppointmnetInitial());
  List<ChooseAppointmnetData> chooseAppointmentList =[];


  chooseAppointment({
    required String id
}) async {
    showLoading();
    var response = await AppDio.get(endPoint: EndPoints.getSlot+id);
    ChooseAppointmentModel chooseAppointmentModel = ChooseAppointmentModel.fromJson(response!.data);
    chooseAppointmentList = chooseAppointmentModel.chooseAppointmnetData;
    print(response);
      emit(ChooseAppointmnetSuccess());
  }


  
  bookAppointment({
    required String id,
    required String name,
    required String phone,
    required String note,

  }) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.makeAppointment+id,data: {
      "phone":phone,
      "PatientNote": note,
      "patientName":name,
    });
    ConfirmAppoinmtnetModel confirmAppoinmtnetModel = ConfirmAppoinmtnetModel.fromJson(response!.data);
    if(confirmAppoinmtnetModel.apiStatus == true){
      hideLoading();
      emit(ChooseAppointmnetSuccess());
      print(response);
    } else{
      hideLoading();
      emit(ChooseAppointmnetFailure());
      print(response);

    }

  }
}
