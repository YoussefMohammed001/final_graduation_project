import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ApppointmentAppBar extends StatelessWidget {
  const ApppointmentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 30.sp,bottom: 20.sp,left: 15.sp,right: 15.sp),
      color: AppColors.primary,
      child: Row(

        children:  [
          Text(S().appointments,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          Spacer(),
        ],

      ),
    );
  }
}

