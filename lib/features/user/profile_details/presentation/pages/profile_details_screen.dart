import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/manager/profile_details_cubit.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/widgets/profile_details_app_bar.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: camel_case_types, must_be_immutable
class profileDetailsScreen extends StatelessWidget {
   profileDetailsScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
   TextEditingController password = TextEditingController();

   TextEditingController currentpasswordController = TextEditingController();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   final cubit = ProfileDetailsCubit();
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocListener<ProfileDetailsCubit, ProfileDetailsState>(
  listener: (context, state) {
    if(state is ProfileDetailsLoading){
      showLoading();
    } if(state is ProfileDetailsChangePassSuccess){
      showSuccess(state.sucsessMessage);
      pop(context);
    } if(state is ProfileDetailsChangePassFailure){
      showError(state.failureMessage);
    }  if(state is ProfileDeleteSuccess){
      showSuccess(state.sucsessMessage);
    } if(state is ProfileDeleteFailure){
      showError(state.failureMessage);
    }

  },
  child: Scaffold(
      body: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const ProfileDetailsAppBar(),
            SizedBox(height: 3.h),
            const UserImage(),
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
              hint: MyShared.getString(key: MySharedKeys.username),
              isPassword: false,
              controller: nameController,

              textInputType: TextInputType.text,
            ),
            SizedBox(height: 1.h),
            MyTextFormField(
              margin: EdgeInsets.symmetric(horizontal: 19.sp),

              validators: (value) {
                if (value!.isEmpty) {
                  return "Email is required";
                }
                if (!value.contains("@") || !value.contains(".")) {
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
              },
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: phoneController,
              hint: "Mobile number",
              isPassword: false,
            ),
            SizedBox(height: 1.h),
            InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 47.h,
                      margin: EdgeInsets.all(20.sp),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Change Password", style: TextStyle(fontSize: 18.sp,
                                fontWeight: FontWeight.bold),),
                            SizedBox(height: 2.h,),
                            MyTextFormField(
                              margin: EdgeInsets.symmetric(horizontal: 17.sp),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Current Password is required";
                                }
                                if (value.length < 6) {
                                  return "Password Not Valid";
                                }
                                return null;
                              },
                              textInputType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              controller: currentpasswordController,
                              hint: "Current password",
                              isPassword: true,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyTextFormField(
                              margin: EdgeInsets.symmetric(horizontal: 17.sp),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Password is required";
                                }
                                if (value.length < 6) {
                                  return "Password Not Valid";
                                }
                                return null;
                              },
                              textInputType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              controller: passwordController,
                              hint: "new Password",
                              isPassword: true,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            MyTextFormField(
                              margin: EdgeInsets.symmetric(horizontal: 17.sp),
                              validators: (value) {
                                if (value!.isEmpty) {
                                  return "Confirm your Password";
                                } if(passwordController.text !=  confirmPasswordController.text){
                                  return "Password doesn't match";

                                }
                              },
                              textInputType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              controller: confirmPasswordController,
                              hint: "Re-password",
                              isPassword: true,
                            ),

                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Expanded(
                                    flex: 3,
                                    child: AppButton(
                                        margin: EdgeInsets.all(10.sp),
                                        bgColor: AppColors.primary,
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            cubit.userChangePass(
                                                oldPass: currentpasswordController
                                                    .text,
                                                newPass: passwordController.text);
                                          }
                                        },
                                        label: "Save Changes")),
                                Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        pop(context);
                                      },
                                      child: Container(
                                          alignment: AlignmentDirectional.center,
                                          child: Text("Cancel")),
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
                      "Change password",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 2.h,),
            AppButton(onPressed: (){}, label: "Save",bgColor: AppColors.primary,margin: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 18.sp),borderRadius: BorderRadius.circular(14.sp),),
            SizedBox(height: 2.h,),
            InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 35.h,
                      margin: EdgeInsets.all(20.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 5.h,),

                          Text("Enter your password to delete account",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                          SizedBox(height: 3.h,),
                          MyTextFormField(hint: "password", controller: password, isPassword: true, textInputAction: TextInputAction.done, textInputType: TextInputType.text),
                          AppButton(
                            margin: EdgeInsets.all(8.sp),
                            onPressed: (){
                              cubit.userDeleteAccount(password: password.text);

                            }, label: "Delete",bgColor: AppColors.primary,),
                          SizedBox(height: 3.h,),
                          Center(child: InkWell(
                              onTap: (){
                                pop(context);

                              },
                              child: const Text("Cancel")))

                        ],
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
         children: [
           AppSVG(assetName: "delete_1"),
           SizedBox(width: 2.w,),
           Text("Delete Account",style: TextStyle(color: Colors.red),)
         ],

              ),
            ),

          ]

      ),
    ),
),
);
  }
}
