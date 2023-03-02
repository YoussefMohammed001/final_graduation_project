import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/register/presentation/manager/register/register_cubit.dart';
import 'package:final_graduation_project/features/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:final_graduation_project/features/verifyAccount/presentation/pages/verify_account_screen.dart';
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

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController fromController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
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
      child: SafeArea(
        child: Scaffold(

          body: Container(
            margin: EdgeInsets.only(right: 20.sp, left: 20.sp, top: 10.sp),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(

                      height: 1.h,
                    ),
                    Text("register Now",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: Colors.grey)),
                    SizedBox(height: 20.sp),
                    MyTextFormField(
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
                      title: "username",
                      icon: Icons.person_outline_outlined,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 18.sp),
                    MyTextFormField(
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
                      title: "Email",
                      icon: Icons.email_outlined,
                    ),
                    SizedBox(height: 18.sp),
                    MyTextFormField(
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
                      title: "password",
                      icon: Icons.lock_outline_rounded,
                    ),
                    SizedBox(
                      height: 18.sp,
                    ),
                    MyTextFormField(
                      validators: (value) {
                        if (value!.isEmpty) {
                          return "Confirm your Password";
                        }
                      },
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: confirmPasswordController,
                      hint: "Confirm your password",
                      isPassword: true,
                      title: "Confirm password",
                      icon: Icons.lock_outline_rounded,
                    ),
                    MyTextFormField(
                      validators: (value) {
                        if (value!.isEmpty) {
                          return "your city is required";
                        }
                      },
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: cityController,
                      hint: "city",
                      isPassword: false,
                      title: "City",
                      icon: Icons.location_city_outlined,
                    ),
                    MyTextFormField(

                      validators: (value) {
                        if (value!.isEmpty) {
                          return "Your Location is required";
                        }
                      },
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: fromController,
                      hint: "where are you from",
                      isPassword: false,
                      title: "Location",
                      icon: Icons.location_on_outlined,
                    ),
                    Stack(
                      children: [
                        AppButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<RegisterCubit>().userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  confirmPassword: confirmPasswordController
                                      .text,
                                  city: cityController.text,
                                  from: fromController.text);
                            }
                          },
                          borderRadius: BorderRadius.circular(14.sp),
                          margin: EdgeInsets.all(8.sp),
                          label: 'register',
                          bgColor: AppColors.primary,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
