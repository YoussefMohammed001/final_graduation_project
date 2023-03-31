import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/pages/single_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpictialestDoctorsItem extends StatelessWidget {
  const SpictialestDoctorsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        push(context, const SingleDoctor());
      },
      child: Container(
        margin: EdgeInsets.only(left:15.sp,right: 15.sp,bottom: 0.sp),
        width: 25.w,
        height: 68.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(
              imageUrl:
              "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60",
              width: double.infinity,
              height: 11.h,
              topRightRadius: 15.sp,
              topLeftRadius: 15.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.5.w,
                    ),
                    AppSVG(
                        height: 2.h,
                        width: 2.w,
                        assetName: "ic_tabs_ic_account_active",
                        color: AppColors.text
                    ),
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
                Row(
                  children: [
                    SizedBox(
                      width: 0.5.w,
                    ),
                    AppSVG(
                      height: 2.h,
                      width: 2.w,
                      assetName: "member_card_1",

                    ),
                    SizedBox(
                      width: 0.5.w,
                    ),
                    Text(
                      "Chest's disease",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ],
                ),


                SizedBox(
                  height: 1.h,
                ),
                Row(
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
                SizedBox(height: 1.h,),
                AppButton(

                  onPressed: (){


                }, label: "Book now",
                  bgColor: AppColors.primary
                  ,margin: EdgeInsets.only(left:15.sp,right:15.sp,top: 0,bottom: 0),

                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
