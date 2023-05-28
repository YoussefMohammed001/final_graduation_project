import 'dart:io';

import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/pick_image_dialogue.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/manager/profile_details_cubit.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/widgets/profile_details_app_bar.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/widgets/user_image.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: camel_case_types, must_be_immutable
class profileDetailsScreen extends StatefulWidget {
  const profileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<profileDetailsScreen> createState() => _profileDetailsScreenState();
}

// ignore: camel_case_types
class _profileDetailsScreenState extends State<profileDetailsScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController currentpasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final cubit = ProfileDetailsCubit();

  File? _image;
  final pickedFile = ImagePicker();

  uploadImage(ImageSource source) async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        cubit.userUploadImage(
            image: _image!.path.toString(),
            id: MyShared.getString(key: MySharedKeys.id));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit,
        child: BlocListener<ProfileDetailsCubit, ProfileDetailsState>(
          listener: (context, state) {
            if (state is ProfileDetailsLoading) {
              showLoading();
            }
            if (state is ProfileDetailsChangePassSuccess) {
              showSuccess(state.sucsessMessage);
              pop(context);
            }
            if (state is ProfileDetailsChangePassFailure) {
              showError(state.failureMessage);
            }
            if (state is ProfileDeleteSuccess) {
              pushAndRemoveUntil(context, const LoginScreen());
              safePrint("a");
              showSuccess(state.sucsessMessage);
            } if(state is ProfileDeleteFailure){
              showError(state.failureMessage);
            }

            if (state is UploadUserImageSuccess) {
              hideLoading();
              showSuccess(state.successMessage);
            }

            if (state is UpdateUserDataSuccess) {
              showSuccess(state.message);
              nameController.clear();
              phoneController.clear();
            }

            if (state is UpdateUserDataFailure) {
              showError(state.errorMessage);
              nameController.clear();
              phoneController.clear();
            }
          },
          child: Scaffold(
            body: Column(
              children: [
                const ProfileDetailsAppBar(),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constrains) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constrains.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(children: [
                            SizedBox(height: 3.h),
                            UserImage(
                              userImage: MyShared.getString(
                                  key: MySharedKeys.patientImage),
                              onTap: () {
                                dialogBuilder(context,() {
                                  uploadImage(ImageSource.camera);
                                  pop(context);
                                  safePrint("camera");
                                },
                                () {
                                  uploadImage(ImageSource.gallery);
                                  pop(context);
                                  safePrint("gallery");

                                },
                                );
                              },
                            ),
                            SizedBox(height: 3.h),
                            MyTextFormField(
                              margin: EdgeInsets.symmetric(horizontal: 19.sp),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Username is Required";
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              hint: MyShared.getString(
                                  key: MySharedKeys.username),
                              isPassword: false,
                              controller: nameController,
                              textInputType: TextInputType.text,
                            ),
                            SizedBox(height: 1.h),
                            MyTextFormField(
                              enabled: false,
                              margin: EdgeInsets.symmetric(horizontal: 19.sp),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Email is required";
                                }
                                if (!value.contains("@") ||
                                    !value.contains(".")) {
                                  return "Email Not Valid";
                                }
                                return null;
                              },
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              controller: emailController,
                              hint: MyShared.getString(key: MySharedKeys.email),
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyTextFormField(
                              margin: EdgeInsets.symmetric(horizontal: 17.sp),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Confirm your Password";
                                }
                                return null;
                              },
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: phoneController,
                              hint:
                                  "0${MyShared.getInt(key: MySharedKeys.phone)}",
                              isPassword: false,
                            ),
                            SizedBox(height: 1.h),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 48.h,
                                      margin: EdgeInsets.all(20.sp),
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              S().changePassword,
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            MyTextFormField(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 17.sp),
                                              validators: (value) {
                                                if (value!.isEmpty) {
                                                  return "Current Password is required";
                                                }
                                                if (value.length < 6) {
                                                  return "Password Not Valid";
                                                }
                                                return null;
                                              },
                                              textInputType:
                                                  TextInputType.visiblePassword,
                                              textInputAction:
                                                  TextInputAction.done,
                                              controller:
                                                  currentpasswordController,
                                              hint: S().currentPassword,
                                              isPassword: true,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            MyTextFormField(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 17.sp),
                                              validators: (value) {
                                                if (value!.isEmpty) {
                                                  return "Password is required";
                                                }
                                                if (value.length < 6) {
                                                  return "Password Not Valid";
                                                }
                                                return null;
                                              },
                                              textInputType:
                                                  TextInputType.visiblePassword,
                                              textInputAction:
                                                  TextInputAction.done,
                                              controller: passwordController,
                                              hint: S().newPass,
                                              isPassword: true,
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            MyTextFormField(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 17.sp),
                                              validators: (value) {
                                                if (value!.isEmpty) {
                                                  return "Confirm your Password";
                                                }
                                                if (passwordController.text !=
                                                    confirmPasswordController
                                                        .text) {
                                                  return "Password doesn't match";
                                                }
                                                return null;
                                              },
                                              textInputType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              controller:
                                                  confirmPasswordController,
                                              hint: S().rePassword,
                                              isPassword: true,
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                    flex: 3,
                                                    child: AppButton(
                                                        margin: EdgeInsets.all(
                                                            10.sp),
                                                        bgColor:
                                                            AppColors.primary,
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            cubit.userChangePass(
                                                                oldPass:
                                                                    currentpasswordController
                                                                        .text,
                                                                newPass:
                                                                    passwordController
                                                                        .text);

                                                          }
                                                        },
                                                        label:
                                                            S().saveChanges)),
                                                Expanded(
                                                    flex: 1,
                                                    child: InkWell(
                                                      onTap: () {
                                                        pop(context);
                                                      },
                                                      child: Container(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .center,
                                                          child:
                                                              Text(S().back)),
                                                    ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 19.sp),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppSVG(
                                      assetName: "padlock",
                                      height: 2.2.h,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      S().changePassword,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 2.h,
                            ),
                            AppButton(
                              onPressed: () {
                                cubit.userUpdateData(
                                    name: nameController.text.isEmpty ? MyShared.getString(key: MySharedKeys.username) : nameController.text,
                                    phone: phoneController.text,
                                    id: MyShared.getString(
                                        key: MySharedKeys.id));
                              },
                              label: S().saveChanges,
                              bgColor: AppColors.primary,
                              margin: EdgeInsets.symmetric(
                                  vertical: 5.sp, horizontal: 18.sp),
                              borderRadius: BorderRadius.circular(14.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 39.h,
                                      margin: EdgeInsets.all(20.sp),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Text(
                                            S().enterYourPasswordToDeleteAccount,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          MyTextFormField(
                                              hint: S().password,
                                              controller: password,
                                              isPassword: true,
                                              textInputAction:

                                                  TextInputAction.done,
                                              textInputType:
                                                  TextInputType.text),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          AppButton(
                                            margin: EdgeInsets.all(8.sp),
                                            onPressed: () {
                                              cubit.userDeleteAccount(
                                                  password: password.text);
                                            },
                                            label: S().deleteAccount,
                                            bgColor: AppColors.primary,
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Center(
                                              child: InkWell(
                                                  onTap: () {
                                                    pop(context);
                                                  },
                                                  child: Text(S().back)))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const AppSVG(assetName: "delete_1"),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    S().deleteAccount,
                                    style: const TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
