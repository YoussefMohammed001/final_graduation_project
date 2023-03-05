// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/profile/data/models/LogoutModel.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  LogoutModel logoutModel = LogoutModel();

  userLogout() async {

    emit(ProfileLoading());
    var response = await AppDio.get(endPoint: "logout",);
    logoutModel = LogoutModel.fromJson(response!.data);
    if(logoutModel.apiStatus ==true){
      safePrint("name>> ${logoutModel.message}");
      safePrint(response);
      emit(ProfileLogoutSucsess(logoutModel.message,));
      await deleteUserData();
    } else{
      emit(ProfileLogoutFailure(logoutModel.message));
      safePrint(response);

    }

  }

  deleteUserData() async {
    MyShared.putString(key:MySharedKeys.email, value:"");
    MyShared.putString(key: MySharedKeys.username, value:"");
    MyShared.putString(key: MySharedKeys.apiToken, value:"");
  }

}

