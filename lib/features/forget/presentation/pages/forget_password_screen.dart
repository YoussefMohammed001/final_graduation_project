import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/forget/presentation/manager/change_password/change_pass_cubit.dart';
import 'package:final_graduation_project/features/forget/presentation/manager/forgot_pass/forgot_password_cubit.dart';
import 'package:final_graduation_project/features/forget/presentation/pages/recovery_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          showLoading();
        }
        if (state is ForgotPasswordSucsess) {
          hideLoading();
          push(context, BlocProvider(
            create: (context) => ChangePassCubit(),
            child: RecoveryPasswordScreen(),
          ));
          // Alerts.showErrorDialog(context: context, errorMessage: state.sucssesMessage);
        }
        if (state is ForgotPasswordFailure) {
          hideLoading();
          showError(state.errorMessage);
          // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(15.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Text("Forget Password",
                              style: TextStyle(fontSize: 20.sp)))
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text("Please Enter Your Email Below",
                        style: TextStyle(fontSize: 17.sp)),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  MyTextFormField(
                    validators: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Email";
                      }
                      return null;
                    },
                    hint: "Email@gmail.com",
                    controller: emailController,
                    isPassword: false,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  AppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<ForgotPasswordCubit>().userForgotPass(
                            email: emailController.text.trim());
                      }
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
