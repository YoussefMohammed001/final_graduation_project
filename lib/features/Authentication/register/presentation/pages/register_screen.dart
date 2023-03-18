import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/Authentication/register/presentation/manager/register/register_cubit.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/presentation/pages/verify_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController MobileController = TextEditingController();

  TextEditingController fromController = TextEditingController();
  final cubit = RegisterCubit();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        safePrint("state=> $state");
        if (state is PostRegisterLoadingState) {
          showLoading();
        }
        if (state is PostRegisterSuccessState) {
          push(context, BlocProvider(
            create: (context) => VerifyCubit(),
            child: VerifyAccountScreen(),
          ));
          hideLoading();
          showSuccess(state.sucssesMessage);
          // Alerts.showErrorDialog(context: context, errorMessage: state.sucssesMessage);
        }
        if (state is PostRegisterFailureState) {
          hideLoading();
          showError(state.errorMessage);
          // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
      },
      child: Scaffold(

        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    "assets/images/bk.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Column(
                    children: [

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
                      SizedBox(height: 2.h,),
                      MyTextFormField(
                        margin: EdgeInsets.symmetric(horizontal: 17.sp),

                        validators: (value) {
                          if (value!.isEmpty) {
                            return "Username is Required";
                          }

                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        hint: "Enter your username",
                        isPassword: false,
                        controller: nameController,

                        textInputType: TextInputType.text,
                      ),
                      SizedBox(height: 1.h),
                      MyTextFormField(
                        margin: EdgeInsets.symmetric(horizontal: 17.sp),

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
                        hint: "Enter Your Email",
                        isPassword: false,

                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      MyTextFormField(
                        margin: EdgeInsets.symmetric(horizontal: 17.sp),

                        validators: (value) {
                          if (value!.isEmpty) {
                            return "Mobile Number";
                          }
                          if (value.length != 11) {
                            return "Mobile number not valid";
                          }
                          return null;
                        },
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        controller: MobileController,
                        hint: "Enter Your Mobile number",
                        isPassword: false,

                      ),
                      SizedBox(height: 1.h),
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
                        hint: "Enter a Password",
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
                          }
                          return null;
                        },
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        controller: confirmPasswordController,
                        hint: "Re-password",
                        isPassword: true,

                      ),
                      SizedBox(height: 2.h,),
                      AppButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.userRegister(name: nameController.text, email: emailController.text
                                , password: passwordController.text, confirmPassword: confirmPasswordController.text
                                , city: MobileController.text, from:fromController.text );
                          }
                        },
                        label: "Join now",
                        bgColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(vertical: 18.sp),
                        margin: EdgeInsets.symmetric(horizontal: 17.sp),
                        borderRadius: BorderRadius.circular(15.sp),),
                      SizedBox(height: 2.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          const Text("Already have account? "),
                          InkWell(
                            onTap: () {
                              push(context, BlocProvider(
                                create: (context) => LoginCubit(),
                                child: const LoginScreen(),
                              ));
                            },
                            child: const Text(
                              "Sign in now",
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h,),



                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
);
  }
}