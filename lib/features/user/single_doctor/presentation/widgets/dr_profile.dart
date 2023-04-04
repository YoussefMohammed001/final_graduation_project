import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                  RatingBarIndicator(
                    rating: 2.5,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.sp,
                    direction: Axis.horizontal,
                  ),

                  Text("(2.5/5)",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),)
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
                S().specialization,
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
                S().consultingPrice,
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
