import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';


import 'package:final_graduation_project/features/user/profile_details/presentation/widgets/change_password.dart';

import 'package:final_graduation_project/features/user/profile_details/presentation/widgets/profile_details_app_bar.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: camel_case_types, must_be_immutable
class profileDetailsScreen extends StatelessWidget {
   profileDetailsScreen({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController fromController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
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
        SizedBox(height: 1.h),
        MyTextFormField(
          margin: EdgeInsets.symmetric(horizontal: 19.sp),

          validators: (value) {
            if (value!.isEmpty) {
              return "your city is required";
            }
            return null;
          },
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: cityController,
          hint: MyShared.getString(key: MySharedKeys.city),
          isPassword: false,

        ),
        SizedBox(height: 1.h,),
        MyTextFormField(
          margin: EdgeInsets.symmetric(horizontal: 19.sp),

          validators: (value) {
            if (value!.isEmpty) {
              return "Your Location is required";
            }
            return null;
          },
          textInputType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: fromController,
          hint: MyShared.getString(key: MySharedKeys.from),
          isPassword: false,

        ),
        SizedBox(height: 1.h,),
        ChangePass(),
        SizedBox(height: 2.h,),
        AppButton(onPressed: (){}, label: "Save",bgColor: AppColors.primary,margin: EdgeInsets.all(18.sp),borderRadius: BorderRadius.circular(14.sp),),

      ]

    );
  }
}
