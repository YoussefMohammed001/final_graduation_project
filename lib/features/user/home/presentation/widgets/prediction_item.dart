import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PredictionItem extends StatelessWidget {
  const PredictionItem({Key? key, required this.prediction}) : super(key: key);
final String prediction;
@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 21.sp,horizontal: 15.sp),
      margin: EdgeInsets.symmetric(horizontal: 17.sp,vertical: 10.sp
      ),
      decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(10.sp)
      ),
      width: double.infinity,
      child: Text(prediction,style: TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold),),
    );
  }
}
