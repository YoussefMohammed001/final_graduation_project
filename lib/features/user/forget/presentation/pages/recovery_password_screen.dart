import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/user/forget/presentation/widgets/otp_item.dart';
import 'package:flutter/material.dart';
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
    return Form(
      key: _formKey,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forget your password?",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      Text(
                        "Don’t worry",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp),
                      ),
                      SizedBox(
                        height: 3.5.h,
                      ),
                      Text(
                        "Enter otp sent to your email",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                    OTPItem(first: true, last: false,),
                    OTPItem(first: false, last: false,),
                    OTPItem(first: false, last: false,),
                    OTPItem(first: false, last: true,),

                  ],),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                      push(context, RecoveryPasswordScreen());
                    },
                    label: "Activate",
                    padding: EdgeInsets.symmetric(vertical: 18.sp),
                    bgColor: AppColors.primary,
                    margin: EdgeInsets.symmetric(horizontal: 17.sp),
                    borderRadius: BorderRadius.circular(15.sp),
                  ),

                  Container(
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsets.all(20.sp),
                    child: Text(
                      "Send OTP again",
                      style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),

                  ),

                ],
              ),
            ],
          )),
    );
  }
}
