import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ApppointmentAppBar extends StatelessWidget {
  const ApppointmentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top:30.sp,right: 30.sp,left: 30.sp,bottom: 20.sp),
      width: double.infinity,
      color: AppColors.primary,
      child: Container(
          alignment: AlignmentDirectional.bottomStart,
          child: const Text("Appointment",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

    );
  }
}

