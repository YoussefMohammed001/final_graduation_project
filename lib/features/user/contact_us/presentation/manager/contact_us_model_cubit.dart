import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/contact_us/data/contact_us_model.dart';
import 'package:meta/meta.dart';

part 'contact_us_model_state.dart';

class ContactUsModelCubit extends Cubit<ContactUsModelState> {
  ContactUsModelCubit() : super(ContactUsModelInitial());
  ContactUsModel contactUsModel = ContactUsModel();


  contactUs({
    required String name,
    required String email,
    required String note,

}) async {
    showLoading();
    var response = await AppDio.post(endPoint: EndPoints.contactUs,data:
    {
        "patientName":name,
        "email":email,
        "patientNote":note
    });
    contactUsModel = ContactUsModel.fromJson(response!.data);
    if(contactUsModel.apiStatus == true){
      emit(ContactUsModelSucsess());
      hideLoading();
      showSuccess(contactUsModel.message.toString());
      safePrint(response);
    } else{
      emit(ContactUsModelFailure());
      hideLoading();
      showError(contactUsModel.message.toString());
    }
  }
}
