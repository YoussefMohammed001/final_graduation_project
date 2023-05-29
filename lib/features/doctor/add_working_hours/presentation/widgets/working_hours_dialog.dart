import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future timeItem(
  BuildContext context, {
  required final VoidCallback done,
  required final VoidCallback cancel,
  required final String title,
  required final Function(num from,num to) fromTo,
}) {
  TextEditingController hoursStart = TextEditingController();
  TextEditingController hoursEnd = TextEditingController();
  TextEditingController minStart = TextEditingController();
  TextEditingController minEnd = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          alignment: AlignmentDirectional.center,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          actions: [
            Padding(
              padding: EdgeInsets.all(18.sp),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Start time(24H Format)",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextFormField(
                              validators: (value){
                                if(value.isEmpty){
                                  return "required";
                                }
                              },
                              hint: "00",
                              controller: hoursStart,
                              isPassword: false,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text(
                          ":",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: MyTextFormField(
                            validators: (value){
                              if(value.isEmpty){
                                return "required";
                              }
                            },
                              hint: "00",
                              controller: minStart,
                              isPassword: false,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text("End time (24H Format)",style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextFormField(
                              validators: (value){
                                if(value.isEmpty){
                                  return "required";
                                }
                              },
                              hint: "00",
                              controller: hoursEnd,
                              isPassword: false,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text(
                          ":",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Expanded(
                          child: MyTextFormField(
                              validators: (value){
                                if(value.isEmpty){
                                  return "required";
                                }
                              },
                              hint: "00",
                              controller: minEnd,
                              isPassword: false,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.number),
                        ),
                      ],
                    ),

                    SizedBox(height: 2.h,),
                    Row(children: [
                        Expanded(
                          child: AppButton(

                            bgColor: AppColors.primary,
                              borderRadius: BorderRadius.circular(16.sp),
                              margin: EdgeInsets.all(7.sp),
                              onPressed: (){
                             if(_formKey.currentState!.validate()){
                               num from =double.tryParse("${hoursStart.text}.${minStart.text}") ?? 0.0;
                               num to =double.tryParse("${hoursEnd.text}.${minEnd.text}") ?? 0.0;
                               fromTo.call(from, to);
                             }
                              },
                              label: "add"),
                        ),
                        SizedBox(width: 2.w,),
                        InkWell(onTap: cancel, child: const Text("cancel")),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]);
    },
  );
}
