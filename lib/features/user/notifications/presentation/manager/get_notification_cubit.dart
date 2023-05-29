// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/notifications/data/get_notification_data_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_notification_state.dart';

class GetNotificationCubit extends Cubit<GetNotificationState> {
  GetNotificationCubit() : super(GetNotificationInitial());

  List<SeenNotification> seenNotification = [];
List data = [];
  getNotifications() async {

    showLoading();
    var response = await AppDio.post(
      endPoint: EndPoints.notifications,
      data: {
        "userId": MyShared.getString(key: MySharedKeys.id),
      },
    );
    safePrint("message");

    GetNotificationDataModel getNotificationDataModel =
        GetNotificationDataModel.fromJson(response!.data);
    seenNotification =
        getNotificationDataModel.seenNotificationData
            .seenNotification;
data = seenNotification;
emit(GetNotificationSuccess());
    hideLoading();
    safePrint(response.data);
  }
}
