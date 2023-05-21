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
import 'package:final_graduation_project/generated/l10n.dart';
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

  TextEditingController mobileController = TextEditingController();


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
          pushAndRemoveUntil(context, BlocProvider(
            create: (context) => VerifyCubit(),
            child: VerifyAccountScreen(),
          ));
          hideLoading();

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
          child: LayoutBuilder(
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
                              height: 45.h,
                            ),
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
                              hint: S().enterYourName,
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
                              hint: S().enterYourEmail,
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
                              controller: mobileController,
                              hint: S().mobileNumber,
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
                              textInputAction: TextInputAction.next,
                              controller: passwordController,
                              hint: S().password,
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
                              hint: S().rePassword,
                              isPassword: true,

                            ),
                            SizedBox(height: 2.h,),
                            AppButton(
                              onPressed: () {
                                int  phone = int.parse(mobileController.text);
                                if (formKey.currentState!.validate()) {
                                  cubit.userRegister(name: nameController.text, email: emailController.text
                                      , password: passwordController.text, confirmPassword: confirmPasswordController.text,
                                      phoneNumber: phone);
                                }
                              },
                              label: S().joinNow,
                              bgColor: AppColors.primary,
                              margin: EdgeInsets.symmetric(horizontal:17.sp),
                              padding: EdgeInsets.all(17.sp),
                              borderRadius: BorderRadius.circular(15.sp),),
                            SizedBox(height: 2.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                 Text(S().alreadyHaveAccount),
                                InkWell(
                                  onTap: () {
                                    push(context, BlocProvider(
                                      create: (context) => LoginCubit(),
                                      child: const LoginScreen(),
                                    ));
                                  },
                                  child:  Text(
                                   S().signIn,
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
        ),
      ),
    ),
));
  }
}
