import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewPassword extends StatelessWidget {
   NewPassword({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Image.asset(
                "assets/images/bk.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
              ListView(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Column(
                    children: [
                      Text(
                        "Update your password",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      SizedBox(height: 5.h,),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  MyTextFormField(
                      validators: (value) {
                        if (value.isEmpty) {
                          return "Enter a password";
                        }
                      },
                      margin: EdgeInsets.symmetric(horizontal: 17.sp),
                      borderRadius: BorderRadius.circular(13.sp),
                      hint: "Password",
                      controller: passwordController,
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(height: 2.h,),
                  MyTextFormField(
                      validators: (value) {
                        if (value.isEmpty) {
                          return "Enter a password";
                        }
                      },
                      margin: EdgeInsets.symmetric(horizontal: 17.sp),
                      borderRadius: BorderRadius.circular(13.sp),
                      hint: "Re-Password",
                      controller: passwordController,
                      isPassword: true,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppButton(
                    onPressed: () {

                          },
                    label: "Save",
                    padding: EdgeInsets.symmetric(vertical: 18.sp),
                    bgColor: AppColors.primary,
                    margin: EdgeInsets.symmetric(horizontal: 17.sp),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),

                ],
              ),
            ],
          )),
    );
  }
}
