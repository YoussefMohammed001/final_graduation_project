import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/add_review_dialogue.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem(
      {Key? key,
      required this.location,
      required this.drName,
      required this.imgUrl,
      required this.specialization,
      required this.day,
      required this.rating,
      required this.text,
      required this.color,
      required this.time,
      required this.onTap, required this.onRatingUpdate})
      : super(key: key);
  final String location;
  final String drName;
  final String imgUrl;
  final String specialization;
  final String day;
  final VoidCallback onTap;
  final double rating;
  final ValueChanged<double> onRatingUpdate;
  final String text;
  final Color color;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      padding: EdgeInsets.all(20.sp),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.sp),
          border: Border.all(color: Colors.grey.shade200)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                text,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Stack(
                children: [
                  Visibility(
                    visible: MyShared.getBoolean(
                      key: MySharedKeys.currentAppointment,
                    ),
                    child: Row(
                      children: [
                        RatingBarIndicator(
                          rating: rating,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 16.sp,
                          direction: Axis.horizontal,
                        ),
                        Text(
                          "(${rating.toInt()}/5)",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                      visible: MyShared.getBoolean(
                            key: MySharedKeys.currentAppointment,
                          ) ==
                          false,
                      child: InkWell(
                        onTap: () {
                          addReview(context, onTap,onRatingUpdate);
                        },
                        child: const Text(
                          "Add Review",
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage(
                imageUrl: imgUrl,
                width: 25.sp,
                height: 25.sp,
                topRightRadius: 100.sp,
                topLeftRadius: 100.sp,
                bottomRightRadius: 100.sp,
                bottomLeftRadius: 100.sp,
              ),
              SizedBox(
                width: 2.w,
              ),
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
                        "Dr. $drName",
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
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
                        location,
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSVG(
                          height: 2.h, width: 2.w, assetName: "member_card_1"),
                      SizedBox(
                        width: 0.5.w,
                      ),
                      Text(
                        specialization,
                        style: TextStyle(fontSize: 15.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
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
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              day,
                              style: TextStyle(
                                  fontSize: 15.sp, color: AppColors.semiGrey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
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
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                  fontSize: 15.sp, color: AppColors.semiGrey),
                            ),
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
