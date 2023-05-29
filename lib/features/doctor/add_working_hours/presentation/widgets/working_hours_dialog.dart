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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Start time(24H Format)"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
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
                  const Text("End time (24H Format)"),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
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
                            hint: "00",
                            controller: minEnd,
                            isPassword: false,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                            margin: EdgeInsets.all(7.sp),
                            onPressed: (){
                              num from =double.tryParse("${hoursStart.text}.${minStart.text}") ?? 0.0;
                              num to =double.tryParse("${hoursEnd.text}.${minEnd.text}") ?? 0.0;
                              fromTo.call(from, to);
                            },
                            label: "label"),
                      ),
                      InkWell(onTap: cancel, child: const Text("cancel")),
                    ],
                  )
                ],
              ),
            ),
          ]);
    },
  );
}
