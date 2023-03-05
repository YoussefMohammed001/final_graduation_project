import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/forget/presentation/manager/change_password/change_pass_cubit.dart';
import 'package:final_graduation_project/features/forget/presentation/pages/congrant_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class RecoveryPasswordScreen extends StatelessWidget {
  RecoveryPasswordScreen({Key? key}) : super(key: key);

  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePassCubit, ChangePassState>(
      listener: (context, state) {
        if (state is ChangePassLoading) {
          showLoading();
        }
        if (state is ChangePassSucsess) {
          hideLoading();
          push(context, const CongratsScreen());
          // Alerts.showErrorDialog(context: context, errorMessage: state.sucssesMessage);
        }
        if (state is ChangePassFailure) {
          hideLoading();
          showError(state.failureMessage);
          // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(15.sp),
              child: ListView(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          pop(context);
                        },
                        child: Container(
                            padding: EdgeInsets.all(10.sp),
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.sp),
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 20.sp,
                                ))),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Expanded(
                          child: Text("Recovery Password",
                              style: TextStyle(fontSize: 20.sp)))
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text("We have sent an code to you please check your mail",
                        style: TextStyle(fontSize: 17.sp)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  MyTextFormField(
                    validators: (value) {
                      if (value!.isEmpty) {
                        return "please enter the code";
                      }
                      return null;
                    },
                    hint: "Enter Code",
                    controller: codeController,
                    isPassword: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                  MyTextFormField(
                    validators: (value) {
                      if (value!.isEmpty) {
                        return "please enter password";
                      }
                      if (value
                          .toString()
                          .length < 6) {
                        return "password must me more than 6 digits";
                      }
                      return null;
                    },
                    hint: "Enter Password",
                    controller: passwordController,
                    isPassword: true,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                  MyTextFormField(
                    validators: (value) {
                      if (value!.isEmpty) {
                        return "please confirm password";
                      }
                      if (value
                          .toString()
                          .length < 6) {
                        return "password must me more than 6 digits";
                      }

                      if (passwordController.text != passwordConfirmationController.text) {
                        return "doesn't match";
                      }
                      return null;
                    },
                    hint: "Enter Password",
                    controller: passwordConfirmationController,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                  ),
                  AppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ChangePassCubit>().userChangePass(code: codeController.text, password: passwordController.text);
                      }
                      //
                    },
                    bgColor: AppColors.primary,
                    label: "Send Code",
                    borderRadius: BorderRadius.circular(13.sp),
                    margin: EdgeInsets.all(13.sp),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
