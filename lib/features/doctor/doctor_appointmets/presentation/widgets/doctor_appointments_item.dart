import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorAppointmentItems extends StatelessWidget {
  const DoctorAppointmentItems({Key? key, required this.name, required this.phone, required this.day, required this.date, required this.note}) : super(key: key);
final String name;
final String phone;
final String note;
final String day;
final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
      padding: EdgeInsets.all(20.sp),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(18.sp),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            name,
            style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1.h,),
          Text(
            phone,
            style: TextStyle(fontSize: 15.sp),
          ),
          Text(
            note,
            style: TextStyle(fontSize: 15.sp),
          ),
          SizedBox(height: 3.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(11.sp),
                ),
                child: Row(
                  children: [
                    AppSVG(
                        color: AppColors.semiGrey,
                        height: 2.h,
                        width: 2.w,
                        assetName: "calender"),
                    SizedBox(width: 2.w,),
                    Text(day,style: TextStyle(fontSize: 15.sp,color: AppColors.semiGrey),),
                  ],
                ),
              ),
              SizedBox(width: 3.w,),
              Container(
                padding: EdgeInsets.all(12.sp),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(11.sp),
                ),
                child: Row(
                  children: [
                    AppSVG(
                        color: AppColors.semiGrey,
                        height: 2.h,
                        width: 2.w,
                        assetName: "clock"),
                    SizedBox(width: 2.w,),
                    Text(date,style: TextStyle(fontSize: 15.sp,color: AppColors.semiGrey),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
