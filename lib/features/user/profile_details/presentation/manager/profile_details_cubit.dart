// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/profile_details/data/change_pass.dart';
import 'package:final_graduation_project/features/user/profile_details/data/delete_account.dart';
import 'package:final_graduation_project/features/user/profile_details/data/update_data_model.dart';
import 'package:final_graduation_project/features/user/profile_details/data/upload_user_image_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit() : super(ProfileDetailsInitial());
  DeleteAccount deleteAccount = DeleteAccount();
  ChangePass changePass = ChangePass();
  UpdateDataModel updateDataModel = UpdateDataModel();

  userDeleteAccount({required String password}) async {
    emit(ProfileDetailsLoading());
    var response = await AppDio.delete(endPoint: "user/all/", data: {
      "password": password,
    });
    try {
      deleteAccount = DeleteAccount.fromJson(response!.data);
      if (deleteAccount.apiStatus == true) {
        hideLoading();
        safePrint(response);
        emit(ProfileDeleteSuccess(deleteAccount.message));
        SharedPreferences preferences = await SharedPreferences.getInstance();
        MyShared.putBoolean(key: MySharedKeys.firstOpen, value: false);
        await preferences.clear();
      } else {
        hideLoading();
        showError(deleteAccount.message);
        emit(ProfileDeleteFailure(deleteAccount.message));
        safePrint(response);
      }
    } catch (e) {
      hideLoading();
      showError(e.toString());

      emit(ProfileDeleteFailure(deleteAccount.message));
      safePrint(response);
    }
  }

  userChangePass({required String oldPass, required String newPass}) async {
    emit(ProfileDetailsLoading());
    var response = await AppDio.patch(
        endPoint: EndPoints.changePass,
        data: {"oldPass": oldPass, "password": newPass});
    try {
      changePass = ChangePass.fromJson(response!.data);
      if (changePass.apiStatus == true) {
        emit(ProfileDetailsChangePassSuccess(changePass.message));
        safePrint(response);
      }
      if (changePass.apiStatus == false) {
        emit(ProfileDetailsChangePassFailure(changePass.message));
      }
    } catch (e) {
      emit(ProfileDetailsChangePassFailure(changePass.message));
    }
  }

  userUpdateData(
      {required String name, required String phone, required String id}) async {
    emit(ProfileDetailsLoading());
    var response = await AppDio.patch(endPoint: "user/edit-user-data", data: {
      "name": name,
      "phone": phone,
    });
    try {
      updateDataModel = UpdateDataModel.fromJson(response!.data);
      if (updateDataModel.apiStatus == true) {
        await saveUserData();
        emit(UpdateUserDataSuccess(updateDataModel.message));
        safePrint("response $response");
      }
      if (updateDataModel.apiStatus == false) {
        safePrint(response);
        emit(UpdateUserDataFailure(updateDataModel.message));
      }
    } catch (e) {
      safePrint(response);

      emit(UpdateUserDataFailure(updateDataModel.message));
    }
  }

  UploadUserImageModel uploadUserImageModel = UploadUserImageModel();
  userUploadImage({
    required String image,
    required String id,
  }) async {
    emit(ProfileDetailsLoading());
    safePrint("loading");
    var response = await AppDio.postFile(
      endPoint: EndPoints.uploadUserImage + id,
      formData: FormData.fromMap({
        "img": await MultipartFile.fromFile(image),
      }),
    );
    try {
      safePrint("loading");
      uploadUserImageModel = UploadUserImageModel.fromJson(response!.data);
      if (uploadUserImageModel.apiStatus == true) {
        hideLoading();
        await MyShared.putString(
            key: MySharedKeys.patientImage,
            value: uploadUserImageModel.user.profilePicture.url);
        safePrint("response $response");
        emit(UploadUserImageSuccess(uploadUserImageModel.data.toString()));
      }
      if (uploadUserImageModel.apiStatus == false) {
        safePrint("response $response");
        emit(UploadUserImageFailure(uploadUserImageModel.data.toString()));
      }
    } catch (e) {
      emit(UploadUserImageFailure(uploadUserImageModel.data.toString()));
      safePrint("$response");
    }
  }

  saveUserData() async {
    MyShared.putString(
        key: MySharedKeys.email, value: updateDataModel.date.email);
    MyShared.putString(
        key: MySharedKeys.username, value: updateDataModel.date.name);
  }
}
