import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
              RatingBarIndicator(
                rating: 2.5,
                itemBuilder: (context, index) => const Icon(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              AppImage(
                imageUrl:
                    "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60",
                width: 10.w,
                height:6.h,
                topRightRadius: 100.sp,
                topLeftRadius: 100.sp,
                bottomRightRadius: 100.sp,
                bottomLeftRadius: 100.sp,
              ),
              SizedBox(width: 2.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          assetName: "vector"),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Text(
                        "Cairo - Naser City",
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 1.h,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSVG(
                          height: 2.h,
                          width: 2.w,
                          assetName: "member_card_1"),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Text(
                        "Heart Disease",
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(height: 3.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Text("6 March 23",style: TextStyle(fontSize: 15.sp,color: AppColors.semiGrey),),
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
                            Text("6:00 PM",style: TextStyle(fontSize: 15.sp,color: AppColors.semiGrey),),
                          ],
                        ),
                      ),
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