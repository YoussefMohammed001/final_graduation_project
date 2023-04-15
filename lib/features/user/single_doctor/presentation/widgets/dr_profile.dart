import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrProfile extends StatelessWidget {


   DrProfile({Key? key, required this.name, required this.numOfReviews, required this.rating, required this.specialization, required this.fees}) : super(key: key);
  final String name;
  final int numOfReviews;

  final double rating;

  final String specialization;

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
              Text("DR. $name",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),),
              const Spacer(),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.sp,
                    direction: Axis.horizontal,
                  ),

                  Text(" $numOfReviews reviews",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),)
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
                specialization,
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
