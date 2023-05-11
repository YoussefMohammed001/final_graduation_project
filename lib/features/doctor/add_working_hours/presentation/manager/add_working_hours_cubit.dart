import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/data/post_working_hours_model.dart';
import 'package:meta/meta.dart';
part 'add_working_hours_state.dart';

class AddWorkingHoursCubit extends Cubit<AddWorkingHoursState> {
  AddWorkingHoursCubit() : super(AddWorkingHoursInitial());
  PostWorkingHoursModel postWorkingHoursModel = PostWorkingHoursModel();
  Appointments appointments = Appointments();

  postWorkingHours({
    required String id,
    required List<Appointments> appointments,



  }) async {
     var response = await AppDio.post(endPoint: "doctor/addWorkTime", data: {
    "doctorId":id,
    "appointments": appointments,
    }
    );
     safePrint(response.toString());

  }
}
