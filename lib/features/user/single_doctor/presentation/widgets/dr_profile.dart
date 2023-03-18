import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrProfile extends StatelessWidget {
  const DrProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("DR. Ahmed Ali",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
              const Spacer(),
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

            ],
          ),
          SizedBox(height: 3.h,),
          Row(
            children: [
              AppSVG(
                  height: 2.h,
                  width: 2.w,
                  assetName: "single"),
              SizedBox(
                width: 0.5.w,
              ),
              Text(
                "Specialization:",
                style: TextStyle(fontSize: 17.sp),
              ),
              SizedBox(
                width: 0.5.w,
              ),
              Text(
                "Heart disease",
                style: TextStyle(fontSize: 15.sp,color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 1.h,),
          Row(
            children: [
              AppSVG(
                  height: 2.h,
                  width: 2.w,
                  assetName: "file"),
              SizedBox(
                width: 0.5.w,
              ),
              Text(
                "Consultation price:",
                style: TextStyle(fontSize: 17.sp),
              ),
              SizedBox(
                width: 0.5.w,
              ),
              Text(
                "150 EGP",
                style: TextStyle(fontSize: 15.sp,color: Colors.grey),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
