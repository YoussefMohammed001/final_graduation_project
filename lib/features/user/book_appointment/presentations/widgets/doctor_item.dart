import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorItemConfirm extends StatelessWidget {
  const DoctorItemConfirm({Key? key, required this.imageUrl, required this.doctorName, required this.doctorSpecialist, required this.rate, required this.numberOfReviews}) : super(key: key);
final String imageUrl;
final String doctorName;
final String doctorSpecialist;
final double rate;
final String numberOfReviews;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
        color: Colors.white,
      ),

      padding: EdgeInsets.all(18.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImage(
                imageUrl: imageUrl,
                width: 14.w,
                height: 7.h,
              bottomLeftRadius: 15.sp,
              bottomRightRadius: 15.sp,
              topLeftRadius: 15.sp,
              topRightRadius: 15.sp,

            ),
           SizedBox(width: 3.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DR. $doctorName",
              style: TextStyle(
                  fontSize: 17.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0.3.h,),
            Row(

              children: [
                 AppSVG(assetName: "single",height: 16.sp,width: 16.sp,color: AppColors.primary,),
                SizedBox(width: 2.w,),
                Text(
                  doctorSpecialist,
                  style: TextStyle(
                      fontSize: 15.sp, ),
                ),
              ],
            ),
            SizedBox(height: 0.3.h,),
            Row(
              children: [
                RatingBarIndicator(
                  rating: rate,
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

            


          ],

            )

          ],
      )
    );
  }
}
