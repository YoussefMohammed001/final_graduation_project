import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/pages/recovery_password_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final cubit = ForgetPassCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
          if (state is ForgetPassLoading) {
            showLoading();
          }
          if (state is ForgetPassSendCodeSucsess) {
            hideLoading();
            push(context, RecoveryPasswordScreen());
            //  showSuccess(state.successMessage);
          }
          if (state is ForgetPassSendCodeFailure) {
            hideLoading();
            //  showError(state.failureMessage);
            showError(state.failureMessage);
          }
        },
        builder: (context, state) {
          return Form(

            key: emailFormKey,
            child: Scaffold(
                backgroundColor: Colors.white,
                body: LayoutBuilder(
                    builder: (context, constrains) => SingleChildScrollView(

                    child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Image.asset(
                                "assets/images/bk.png",
                                width: double.infinity,
                                fit: BoxFit.fitWidth,
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    height: 50.h,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        S().forgetYourPass,
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ),
                                      Text(
                                        S().doNotWorry,
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp),
                                      ),
                                      SizedBox(
                                        height: 3.5.h,
                                      ),
                                      Text(S().enterYourEmail,
                                        style: TextStyle(
                                            color: AppColors.text,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: 3.5.h,
                                  ),
                                  MyTextFormField(
                                      validators: (value) {
                                        if (value.isEmpty) {
                                          return "Enter your email";
                                        }
                                      },
                                      margin: EdgeInsets.symmetric(horizontal: 17.sp),
                                      borderRadius: BorderRadius.circular(13.sp),
                                      hint: S().email,
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
                                        MyShared.putString(key: MySharedKeys.email, value: emailController.text);
                                        print(emailController.text);
                                        context.read<ForgetPassCubit>()
                                            .sendCode(email: emailController.text);
                                      }
                                    },
                                    label: S().sendCode,
                                    padding: EdgeInsets.symmetric(vertical: 18.sp),
                                    bgColor: AppColors.primary,
                                    margin: EdgeInsets.symmetric(horizontal: 17.sp),
                                    borderRadius: BorderRadius.circular(15.sp),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ));
        },
      ),
    );
  }
}
