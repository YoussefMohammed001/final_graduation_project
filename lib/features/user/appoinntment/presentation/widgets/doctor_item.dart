import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
      padding: EdgeInsets.all(20.sp),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.sp),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow[800],
                size: 16.sp,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow[800],
                size: 16.sp,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow[800],
                size: 16.sp,
              ),
              Icon(
                Icons.star_border,
                color: Colors.grey,
                size: 16.sp,
              ),
              Text(
                "(4/5)",
                style: TextStyle(fontSize: 15.sp),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              AppImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
                width: 9.w,
                height:6.h,
                topRightRadius: 100.sp,
                topLeftRadius: 100.sp,
                bottomRightRadius: 100.sp,
                bottomLeftRadius: 100.sp,
              ),
              SizedBox(width: 2.w,),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSVG(
                        color: AppColors.text,
                          height: 2.h,
                          width: 2.w,
                          assetName: "ic_tabs_ic_account_active"),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Text(
                        "Dr. Ahmed Ali",
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSVG(
                        color: AppColors.text,
                          height: 2.h,
                          width: 2.w,
                          assetName: "ic_tabs_ic_account_active"),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Text(
                        "Dr. Ahmed Ali",
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSVG(
                        color: AppColors.text,
                          height: 2.h,
                          width: 2.w,
                          assetName: "ic_tabs_ic_account_active"),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Text(
                        "Dr. Ahmed Ali",
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                ],
              ),


            ],
          ),
        ],
      ),
    );
  }
}