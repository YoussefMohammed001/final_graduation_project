import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/Authentication/forget/presentation/widgets/otp_item.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:final_graduation_project/features/doctor/doctor_main_screen/doctor_main_screen.dart';
import 'package:final_graduation_project/features/user/main_screen/main_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class VerifyAccountScreen extends StatelessWidget {
  VerifyAccountScreen({Key? key}) : super(key: key);
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCubit, VerifyState>(
        listener: (context, state) {
          safePrint("state=> $state");
          if (state is VerifyLoading) {
            showLoading();
          }
          if (state is VerifySucsess) {
            hideLoading();

            showSuccess(state.sucsessMessage);
            if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == true){
              pushReplacement(context, const DoctorMainScreen());
            }
            if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == false){
              pushReplacement(context, const MainScreen());
            }

            // Alerts.showErrorDialog(context: context, errorMessage: state.sucssesMessage);
          }
          if (state is VerifyFailure) {
            hideLoading();
            showError(state.errorMessage);
            // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
          }
        },
        child: Scaffold(
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
                                      S().verifyYourAccount,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    ),
                                    Text(
                                      S().toCompleteYourRegistration,
                                      style: TextStyle(
                                          color: AppColors.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp),
                                    ),
                                    SizedBox(
                                      height: 3.5.h,
                                    ),
                                    SizedBox(
                                      height: 3.5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        int code = int.parse(
                                            otp1Controller.text +
                                                otp2Controller.text +
                                                otp3Controller.text +
                                                otp4Controller.text);
                                        context
                                            .read<VerifyCubit>()
                                            .userVerify(code: code);
                                      },
                                      label: S().verify,
                                      bgColor: AppColors.primary,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 17.sp),
                                      padding: EdgeInsets.all(17.sp),
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                    ),
                                    Container(
                                      alignment: AlignmentDirectional.center,
                                      margin: EdgeInsets.all(14.sp),
                                      child: Text(
                                        S().sendOTPAgain,
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp),
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
        ));
  }
}
