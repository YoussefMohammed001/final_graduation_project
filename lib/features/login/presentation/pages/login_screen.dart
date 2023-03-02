import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/forget/presentation/manager/forgot_pass/forgot_password_cubit.dart';
import 'package:final_graduation_project/features/forget/presentation/pages/forget_password_screen.dart';
import 'package:final_graduation_project/features/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/main_screen/main_screen.dart';
import 'package:final_graduation_project/features/register/presentation/manager/register/register_cubit.dart';
import 'package:final_graduation_project/features/register/presentation/pages/register_screen.dart';
import 'package:final_graduation_project/features/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:final_graduation_project/features/verifyAccount/presentation/pages/verify_account_screen.dart';
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
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            push(context, BlocProvider(
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
        key: formKey,
        child: SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: ListView(
                  children: [
                    Image.asset(
                      "assets/images/bdg_logo.png",
                      height: 25.h,
                      width: 50.w,
                    ),
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
                    SizedBox(
                      height: 2.h,
                    ),
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
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 10.sp),
                        alignment: AlignmentDirectional.centerEnd,
                        child: InkWell(
                            onTap: () {
                              push(context, BlocProvider(
                                create: (context) => ForgotPasswordCubit(),
                                child: ForgetPasswordScreen(),
                              ));
                            },
                            child: const Text('Forget Password'))),
                    AppButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginCubit>()
                              .userLogin(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      label: "Login",
                      bgColor: AppColors.primary,
                      margin: EdgeInsets.all(15.sp),
                      borderRadius: BorderRadius.circular(13.sp),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      child: const Text(
                        "- - - - - - - - - - - - - - Don't have account - - - - - - - - - - - - - -",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(15.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.sp),
                            ),
                            child: OutlinedButton(
                                onPressed: () {
                                  push(
                                      context,
                                      BlocProvider(
                                        create: (context) => RegisterCubit(),
                                        child: const RegisterScreen(),
                                      ));
                                },
                                child: const Text('Register')),
                          ),
                        ),
                      ],
                    )
                  ],
                ))),
      ),
    );
  }
}
