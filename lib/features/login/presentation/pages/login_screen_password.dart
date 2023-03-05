import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/forget/presentation/manager/forgot_pass/forgot_password_cubit.dart';
import 'package:final_graduation_project/features/forget/presentation/pages/forget_password_screen.dart';
import 'package:final_graduation_project/features/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/main_screen/main_screen.dart';
import 'package:final_graduation_project/features/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:final_graduation_project/features/verifyAccount/presentation/pages/verify_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class LoginScreenPassword extends StatelessWidget {
  LoginScreenPassword({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> passFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        safePrint("state=> $state");
        if (state is LoginLoading) {
          showLoading();
        }
        if (state is LoginSucsess) {
          hideLoading();
          if (state.verified == true) {
            push(context, const MainScreen());
          } else {
            push(
                context,
                BlocProvider(
                  create: (context) => VerifyCubit(),
                  child: VerifyAccountScreen(),
                ));
          }
          showSuccess(state.sucsessMessage);
          // Alerts.showErrorDialog(context: context, errorMessage: state.sucssesMessage);
        }
        if (state is LoginFailure) {
          hideLoading();
          showError(state.errorMessage);

          // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
      },
      child: Form(
        key: passFormKey,
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
                          return "Enter Your Password";
                        }
                        return null;
                      },
                      hint: "password",
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
                          push(context, BlocProvider(
                            create: (context) => ForgotPasswordCubit(),
                            child: ForgetPasswordScreen(),
                          ));
                        },
                        child: Row(
                          children: const [
                            AppSVG(assetName: "ic_ic_password"),
                            Text("Forget Password", style: TextStyle(
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
                          context.read<LoginCubit>().userLogin(
                              email: email, password: passwordController.text);
                        }
                      },
                      label: "Join now",
                      bgColor: AppColors.primary,
                      margin: EdgeInsets.symmetric(horizontal: 17.sp),
                      borderRadius: BorderRadius.circular(13.sp),
                    ),

                  ],
                ),
              ],
            )),
      ),
    );
  }
}