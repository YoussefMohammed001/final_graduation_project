import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactUsItem extends StatelessWidget {
   ContactUsItem({Key? key, required this.name, required this.email, required this.note, required this.onPress}) : super(key: key);
final TextEditingController name ;
final TextEditingController email;
final TextEditingController note;
final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      padding: EdgeInsets.all(18.sp),
      decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(17.sp)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
           Text(S().enterYourName),
          SizedBox(height: 1.h,),
          MyTextFormField(hint: S().username, controller: name, isPassword: false, textInputAction: TextInputAction.next, textInputType: TextInputType.text,),
          SizedBox(height: 3.h,),
           Text(S().enterYourEmail),
          SizedBox(height: 1.h,),


          MyTextFormField(hint: S().email, controller: email, isPassword: false, textInputAction: TextInputAction.next, textInputType: TextInputType.text,),
          SizedBox(height: 3.h,),

           Text(S().enterYourNote),
          SizedBox(height: 1.h,),

          MyTextFormField(
            minLines: 6,
            maxLines: 10,
            hint: S().note, controller: note, isPassword: false, textInputAction: TextInputAction.next, textInputType: TextInputType.text,),
          SizedBox(height: 3.h,),
          AppButton(onPressed: onPress, label: S().send,margin: EdgeInsets.all(10.sp),bgColor: AppColors.primary,borderRadius: BorderRadius.circular(15.sp),padding: EdgeInsets.all(18.sp),)


        ],
      ),
    );
  }
}
