import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentItemConfrim extends StatelessWidget {
  const AppointmentItemConfrim({Key? key, required this.date, required this.price, required this.timeFrom, required this.timeTo}) : super(key: key);
final String date;
final String timeFrom;
final String timeTo;
final String price;

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.sp),
          color: Colors.white,

        ),

        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined,color:AppColors.primary,),

                SizedBox(width: 3.w,),
                Text(
                  "Appointmnet",
                  style: TextStyle(
                      fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4.h,),
            Row(
              children: [
                AppSVG(assetName: "clock",height: 16.sp,width: 16.sp,color: AppColors.primary,),
                SizedBox(width: 3.w,),
                Text("date:",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                SizedBox(width: 1.w,),
                Text(date,style: TextStyle(fontSize: 15.sp,),),
              ],
            ),
            SizedBox(height: 0.7.h,),
            Row(
              children: [
                AppSVG(assetName: "clock",height: 16.sp,width: 16.sp,color: AppColors.primary,),
            SizedBox(width: 3.w,),
                Text("Time:",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                SizedBox(width: 1.w,),

                Text(timeFrom,style: TextStyle(fontSize: 15.sp),),
                SizedBox(width: 1.w,),
                Text("to",style: TextStyle(fontSize: 15.sp),),
                SizedBox(width: 1.w,),
                Text(timeTo,style: TextStyle(fontSize: 15.sp),),
              ],
            ),
            SizedBox(height: 0.7.h,),
            Row(
              children: [
                AppSVG(assetName: "file",height: 16.sp,width: 16.sp,),
                SizedBox(width: 3.w,),
                Text("Fees:",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                SizedBox(width: 1.w,),
                Text(price,style: TextStyle(fontSize: 15.sp),),
              ],
            ),

          ],
        )
    );
  }
}
