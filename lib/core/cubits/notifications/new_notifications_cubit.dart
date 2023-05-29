import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/data/get_notifications_model.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:meta/meta.dart';

part 'new_notifications_state.dart';

class NewNotificationsCubit extends Cubit<NewNotificationsState> {
  NewNotificationsCubit() : super(NewNotificationsInitial());
  List<Notifications>  notifications = [];


  getNotifications() async {
    var response = await AppDio.get(endPoint: EndPoints.newNotifications+MyShared.getString(key: MySharedKeys.id));
    GetNotificationsModel getNotificationsModel = GetNotificationsModel.fromJson(response!.data);
    notifications = getNotificationsModel.notifications;
    safePrint(response.toString());

    emit(NewNotificationsSuccess());
  }
}

