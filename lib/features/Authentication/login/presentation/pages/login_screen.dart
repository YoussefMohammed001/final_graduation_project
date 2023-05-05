import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen_password.dart';
import 'package:final_graduation_project/features/Authentication/register/presentation/pages/register_screen.dart';
import 'package:final_graduation_project/features/doctor/doctor_register_screen/presentation/screens/register_screen_doctor.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                          fit: BoxFit.cover,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 50.h,
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
                            SizedBox(
                              height: 1.5.h,
                            ),
                            MyTextFormField(
                                validators: (value) {
                                  if (value.isEmpty) {
                                    return "Enter your email";
                                  }
                                  return null;
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
                                  MyShared.putString(key: MySharedKeys.email,
                                      value: emailController.text.trim());
                                  push(context, LoginScreenPassword());
                                }
                              },
                              margin: EdgeInsets.symmetric(horizontal:17.sp),
                              padding: EdgeInsets.all(17.sp),
                              label: S().joinNow,
                              bgColor: AppColors.primary,
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(S().doNotHaveAccount),
                                SizedBox(width: 1.w,),
                                InkWell(
                                  onTap: () {
                                    if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == true){
                                      push(context, RegisterScreenDoctor());
                                    }
                                    if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == false){
                                      push(context, RegisterScreen());
                                    }
                                    },
                                  child:  Text(
                                  S().signUpNow,
                                    style: const TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
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
      ) );
  }
}
