import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LatestDoctorItem extends StatelessWidget {
  const LatestDoctorItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13.sp),
      width: 34.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            imageUrl:
                "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
            width: 34.w,
            height: 15.h,
            topRightRadius: 15.sp,
            topLeftRadius: 15.sp,
          ),
          Container(
            padding: EdgeInsets.all(8.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    AppSVG(
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
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Chest's disease",
                  style: TextStyle(fontSize: 15.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
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
                SizedBox(
                  height: 1.h,
                ),
                // AppButton(bgColor: AppColors.primary,onPressed: (){}, label: "Book Now",margin: EdgeInsets.all(0),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
