import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Future timeItem(
  BuildContext context, {
  required final VoidCallback onCameraPressed,
  required final VoidCallback onGalleryPressed,
  required final String title,
  required final TextEditingController hours,
  required final TextEditingController minutes,
}) {
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
                   Text("${title}(24H Format)"),
                  SizedBox(height: 2.h,),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                            hint: "00",
                            controller: hours,
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
                            controller: minutes,
                            isPassword: false,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]);
    },
  );
}
