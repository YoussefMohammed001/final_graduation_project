import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/pages/forget_password_screen.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/presentation/pages/verify_account_screen.dart';
import 'package:final_graduation_project/features/doctor/doctor_main_screen/doctor_main_screen.dart';
import 'package:final_graduation_project/features/user/main_screen/main_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class LoginScreenPassword extends StatelessWidget {
  LoginScreenPassword({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> passFormKey = GlobalKey<FormState>();
  final cubit = LoginCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          safePrint("state=> $state");
          if (state is LoginLoading) {
            showLoading();
          }
          if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == false){
            if (state is LoginSucsess) {
              hideLoading();
              if (state.verified == true) {
                showSuccess(state.sucsessMessage);
                pushAndRemoveUntil(context, MainScreen());
              } else {
                push(
                    context,
                    BlocProvider(
                      create: (context) => VerifyCubit(),
                      child: VerifyAccountScreen(),
                    ));
              }

              // Alerts.showErrorDialog(context: context, errorMessage: state.successMessage);
            }
            if (state is LoginFailure) {
              hideLoading();
              showError(state.errorMessage);


              // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
            }

          }
          if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == true){
            if (state is LoginSucsess) {
              hideLoading();
              if (state.verified == true) {
                showSuccess(state.sucsessMessage);
                pushAndRemoveUntil(context, DoctorMainScreen());
              } else {
                push(
                    context,
                    BlocProvider(
                      create: (context) => VerifyCubit(),
                      child: VerifyAccountScreen(),
                    ));
              }

              // Alerts.showErrorDialog(context: context, errorMessage: state.successMessage);
            }
            if (state is LoginFailure) {
              hideLoading();
              showError(state.errorMessage);

              // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
            }
          }


        },
        child: Form(
          key: passFormKey,
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
                                      S().welcomeToHSPC,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    ),
                                    Text(
                                      S().joinUsNow,
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
                                    if (value == null) {
                                      return "Enter Your Password";
                                    }
                                    if (value.length < 6) {
                                      return "Password invalid";
                                    }
                                    return null;
                                  },
                                  hint: S().password,
                                  controller: passwordController,
                                  isPassword: true,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.emailAddress,
                                  margin: EdgeInsets.symmetric(horizontal: 17.sp),
                                  borderRadius: BorderRadius.circular(13.sp),
                                ),
                                SizedBox(height: 1.h,),

                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 17.sp),

                                  child: InkWell(
                                    onTap: () {
                                      push(context, ForgetPasswordScreen(),);
                                    },
                                    child: Row(
                                      children:  [
                                        const AppSVG(assetName: "ic_ic_password"),
                                        Text(S().forgetPassword, style: const TextStyle(
                                            color: Colors.grey),),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppButton(
                                  onPressed: () {
                                    if (passFormKey.currentState!.validate()) {
                                      String email = MyShared.getString(
                                          key: MySharedKeys.email);
                                      safePrint(email);
                                      cubit.userLogin(
                                          email: email, password: passwordController
                                          .text);
                                    }
                                  },
                                  label: S().joinNow,
                                  bgColor: AppColors.primary,
                                  margin: EdgeInsets.symmetric(horizontal:17.sp),
                                  padding: EdgeInsets.all(17.sp),
                                  borderRadius: BorderRadius.circular(13.sp),
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
