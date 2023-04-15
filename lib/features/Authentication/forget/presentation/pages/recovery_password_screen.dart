import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/manager/forget_pass_cubit/forget_pass_cubit.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/pages/new_password.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/widgets/otp_item.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class RecoveryPasswordScreen extends StatelessWidget {
  RecoveryPasswordScreen({Key? key}) : super(key: key);
  OtpTimerButtonController controller = OtpTimerButtonController();

  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocProvider(
  create: (context) => ForgetPassCubit(),
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
                                    Text(
                                      S().enterOTPSentToYourEmail,
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
                                  children: [
                                    OTPItem(
                                      first: true,
                                      last: false,
                                      controller: otp1Controller,
                                    ),
                                    OTPItem(
                                      first: false,
                                      last: false,
                                      controller: otp2Controller,
                                    ),
                                    OTPItem(
                                      first: false,
                                      last: false,
                                      controller: otp3Controller,
                                    ),
                                    OTPItem(
                                      first: false,
                                      last: true,
                                      controller: otp4Controller,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                AppButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {}
                                    int otp = int.parse(otp1Controller.text +
                                        otp2Controller.text +
                                        otp3Controller.text +
                                        otp4Controller.text);
                                    MyShared.putInt(key: MySharedKeys.otp, value: otp);
                                    safePrint(MyShared.getInt(key: MySharedKeys.otp));
                                    push(context, NewPassword());
                                  },
                                  label: S().verify,
                                  padding: EdgeInsets.symmetric(vertical: 18.sp),
                                  bgColor: AppColors.primary,
                                  margin: EdgeInsets.symmetric(horizontal: 17.sp),
                                  borderRadius: BorderRadius.circular(15.sp),
                                ),
                                SizedBox(height: 2.h,),
                                InkWell(
                                  onTap: (){
                                    context.read<ForgetPassCubit>()
                                        .sendCode(email: MyShared.getString(key: MySharedKeys.email));


                                  },

                                  child: Container(
                                    alignment: AlignmentDirectional.center,
                                    margin: EdgeInsets.all(10.sp),
                                    child: Text(
                                      S().sendOTPAgain,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                  ),
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
));
  }
}
