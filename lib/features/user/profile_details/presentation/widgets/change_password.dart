import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePass extends StatelessWidget {
  ChangePass({Key? key}) : super(key: key);
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController CurrentpasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 43.h,
              margin: EdgeInsets.all(20.sp),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Change Password",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                    SizedBox(height: 2.h,),
                    MyTextFormField(
                      margin: EdgeInsets.symmetric(horizontal: 17.sp),
                      validators: (value) {
                        if (value!.isEmpty) {
                          return "Current Password is required";
                        }
                        if (value.length < 6) {
                          return "Password Not Valid";
                        }
                        return null;
                      },
                      textInputType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      controller: CurrentpasswordController,
                      hint: "Current password",
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
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
                      textInputAction: TextInputAction.done,
                      controller: passwordController,
                      hint: "new Password",
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
                      },
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      controller: confirmPasswordController,
                      hint: "Re-password",
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 3,
                            child: AppButton(
                                margin: EdgeInsets.all(10.sp),
                                bgColor: AppColors.primary,
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){
                                    pop(context);
                                  }

                                },
                                label: "Save Changes")),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                pop(context);
                              },
                              child: Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text("Cancel")),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 19.sp),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppSVG(
              assetName: "padlock",
              height: 2.2.h,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              "Change password",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
