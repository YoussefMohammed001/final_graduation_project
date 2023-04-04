import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/pages/congrant_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cubit = ForgetPassCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<ForgetPassCubit, ForgetPassState>(
        listener: (context, state) {
          if(state is ForgetPassLoading){

            showLoading();
          } if(state is ForgetPassVerifyFailure){
            hideLoading();
            showError(state.failureMessage);
            pop(context);
          } if(state is ForgetPassVerifySucsess){
            hideLoading();
            pushAndRemoveUntil(context, const CongratsScreen());
          }
        },
        child: Form(
          key: _formKey,
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

                              fit: BoxFit.cover,
                            ),
                            Column(
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
                                      return null;
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
                                      return null;
                                    },
                                    margin: EdgeInsets.symmetric(horizontal: 17.sp),
                                    borderRadius: BorderRadius.circular(13.sp),
                                    hint: "Re-Password",
                                    controller: confirmPasswordController,
                                    isPassword: true,
                                    textInputAction: TextInputAction.done,
                                    textInputType: TextInputType.emailAddress),
                                SizedBox(
                                  height: 3.h,
                                ),
                                AppButton(
                                  onPressed: () {
                                    cubit.changePass(otp: MyShared.getInt(key: MySharedKeys.otp).toString(), password: passwordController.text);
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
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    ));
  }
}
