
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/profile/data/models/LogoutModel.dart';
import 'package:final_graduation_project/features/user/profile_details/data/delete_account.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  LogoutModel logoutModel = LogoutModel();
  DeleteAccount deleteAccount =DeleteAccount();

  userLogout() async {
    emit(ProfileLoading());
    var response = await AppDio.get(endPoint:   EndPoints.logout,);
    logoutModel = LogoutModel.fromJson(response!.data);
    if(logoutModel.apiStatus ==true){
      safePrint("name>> ${logoutModel.message}");
      safePrint(response);
      emit(ProfileLogoutSucsess(logoutModel.message,));
      SharedPreferences preferences = await SharedPreferences.getInstance();
      MyShared.putBoolean(key: MySharedKeys.firstOpen, value: false);
      await preferences.clear();
    } else{
      emit(ProfileLogoutFailure(logoutModel.message));
      safePrint(response);

    }

  }




}

