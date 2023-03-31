import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactUsItem extends StatelessWidget {
   ContactUsItem({Key? key}) : super(key: key);
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController note = TextEditingController();
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
          const Text("Enter Your Name"),
          SizedBox(height: 1.h,),
          MyTextFormField(hint: 'Name', controller: name, isPassword: false, textInputAction: TextInputAction.next, textInputType: TextInputType.text,),
          SizedBox(height: 3.h,),
          const Text("Enter Your Email"),
          SizedBox(height: 1.h,),

          MyTextFormField(hint: 'Email', controller: name, isPassword: false, textInputAction: TextInputAction.next, textInputType: TextInputType.text,),
          SizedBox(height: 3.h,),

          const Text("Enter Your Note"),
          SizedBox(height: 1.h,),

          MyTextFormField(hint: 'Note', controller: name, isPassword: false, textInputAction: TextInputAction.next, textInputType: TextInputType.text,),
          SizedBox(height: 3.h,),
          AppButton(onPressed: () {  }, label: 'Send',margin: EdgeInsets.all(10.sp),bgColor: AppColors.primary,borderRadius: BorderRadius.circular(15.sp),padding: EdgeInsets.all(18.sp),)

        ],
      ),
    );
  }
}
