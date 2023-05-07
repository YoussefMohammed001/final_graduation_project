import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrProfile extends StatelessWidget {


   DrProfile({Key? key, required this.name, required this.numOfReviews, required this.rating, required this.specialization, required this.fees, required this.img}) : super(key: key);
  final String name;
  final int numOfReviews;

  final double rating;

  final String specialization;
  final String img;

  final String fees;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  AppImage(imageUrl: img, width: 25.sp, height: 25.sp,

                    topLeftRadius: 50.sp,
                    topRightRadius: 50.sp,
                    bottomRightRadius: 50.sp,
                    bottomLeftRadius: 50.sp,
                  ),
                  SizedBox(width: 1.w,),
                  Text("${S().dr} $name",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 13.sp,
                    direction: Axis.horizontal,
                  ),

                  Text("(${rating.toInt()}/5)",style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),)
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
              Expanded(
                child: Text(
                  specialization,
                  style: TextStyle(fontSize: 15.sp,color: Colors.grey,overflow: TextOverflow.ellipsis),
                ),
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
                "$fees EGP",
                style: TextStyle(fontSize: 15.sp,color: Colors.grey),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
