// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/profile_details/data/change_pass.dart';
import 'package:final_graduation_project/features/user/profile_details/data/delete_account.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit() : super(ProfileDetailsInitial());
  DeleteAccount deleteAccount =DeleteAccount();
  ChangePass changePass = ChangePass();


  deleteUserData() async {
    MyShared.putString(key:MySharedKeys.email, value:"");
    MyShared.putString(key: MySharedKeys.username, value:"");
    MyShared.putString(key: MySharedKeys.apiToken, value:"");
  }


  userDeleteAccount({required String password}) async{
    emit(ProfileDetailsLoading());

    var response = await AppDio.delete(endPoint:  "all/${MyShared.getString(key:MySharedKeys.id)}",data: {
      "password":password,
    });
    try{
      deleteAccount = DeleteAccount.fromJson(response!.data);
      if(deleteAccount.apiStatus == true){
        safePrint(response);
        emit(ProfileDeleteSuccess(deleteAccount.message));
        await deleteUserData();

      }else{
        emit(ProfileDeleteFailure(deleteAccount.message));
        safePrint(response);
      }}catch(e){
      emit(ProfileDeleteFailure(deleteAccount.message));
      safePrint(response);
    }


  }

  userChangePass({required String oldPass,required String newPass}) async{
    emit(ProfileDetailsLoading());
    var response = await AppDio.patch(endPoint: EndPoints.changePass,data: {
      "oldPass":oldPass,
      "password":newPass
    });
   try{ changePass = ChangePass.fromJson(response!.data);
    if(changePass.apiStatus == true){
      emit(ProfileDetailsChangePassSuccess(changePass.message));
      safePrint(response);
    } if(changePass.apiStatus ==false){
      emit(ProfileDetailsChangePassFailure(changePass.message));
    } }catch(e){
     emit(ProfileDetailsChangePassFailure(changePass.message));

   }


  }


}
