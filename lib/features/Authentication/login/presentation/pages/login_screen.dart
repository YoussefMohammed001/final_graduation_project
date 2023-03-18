import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen_password.dart';
import 'package:final_graduation_project/features/Authentication/register/presentation/manager/register/register_cubit.dart';
import 'package:final_graduation_project/features/Authentication/register/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: emailFormKey,
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
                        "Welcome to makfy!",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      Text(
                        "Join us now",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  MyTextFormField(
                      validators: (value) {
                        if (value.isEmpty) {
                          return "Enter your email";
                        }
                        return null;
                      },
                      margin: EdgeInsets.symmetric(horizontal: 17.sp),
                      borderRadius: BorderRadius.circular(13.sp),
                      hint: "email",
                      controller: emailController,
                      isPassword: false,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppButton(
                    onPressed: () {
                      if (emailFormKey.currentState!.validate()) {
                        MyShared.putString(key: MySharedKeys.email,
                            value: emailController.text.trim());
                        push(context, LoginScreenPassword());
                      }
                    },
                    label: "Join now",
                    padding: EdgeInsets.symmetric(vertical: 18.sp),
                    bgColor: AppColors.primary,
                    margin: EdgeInsets.symmetric(horizontal: 17.sp),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have account? "),
                      InkWell(
                        onTap: () {
                          push(context, const RegisterScreen());
                        },
                        child: const Text(
                          "Sign up now",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
