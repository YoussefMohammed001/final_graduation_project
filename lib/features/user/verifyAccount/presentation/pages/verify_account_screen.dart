import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/user/main_screen/main_screen.dart';
import 'package:final_graduation_project/features/user/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class VerifyAccountScreen extends StatelessWidget {
  VerifyAccountScreen({Key? key}) : super(key: key);
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyCubit, VerifyState>(

      listener: (context, state) {
        safePrint("state=> $state");
        if(state is VerifyLoading){
          showLoading();
        }
        if(state is VerifySucsess){
          push(context,  const MainScreen());
          hideLoading();
          showSuccess(state.sucsessMessage);
          // Alerts.showErrorDialog(context: context, errorMessage: state.sucssesMessage);
        }  if(state is VerifyFailure){
          hideLoading();
          showError(state.errorMessage);
          // Alerts.showErrorDialog(context: context, errorMessage: state.errorMessage);
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.all(15.sp),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        pop(context);
                      },
                      child: Container(
                          padding: EdgeInsets.all(10.sp),
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.sp),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 20.sp,
                              ))),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Expanded(
                        child: Text("Verify Account",
                            style: TextStyle(fontSize: 20.sp)))
                  ],
                ),

                MyTextFormField(
                    hint: "******",
                    controller: codeController,
                    isPassword: false,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                   ),
                SizedBox(height: 2.h,),
                AppButton(onPressed: () {
                  int code = int.parse(codeController.text);
                  context.read<VerifyCubit>().userVerify(
                      code: code);
                }, label: "Verify",
                bgColor: AppColors.primary,
                  margin: EdgeInsets.all(10.sp),
                  borderRadius: BorderRadius.circular(15.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
