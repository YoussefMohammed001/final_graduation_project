import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/screens/choose_appointment_screen.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/pages/single_doctor.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({Key? key, required this.img, required this.name, required this.specialist, required this.review, required this.onTap}) : super(key: key);
  final String img;
  final String name;
  final String specialist;
  final double review;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left:15.sp,right: 15.sp),
        width: 33.w,

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            border: Border.all(color: Colors.grey.shade200)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppImage(
                imageUrl:
                img,
                     width: double.infinity,
                height: 11.h,
                topRightRadius: 15.sp,
                topLeftRadius: 15.sp,

              ),
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
                    assetName: "ic_tabs_ic_account_active",
                  color: AppColors.text
                ),
                SizedBox(
                  width: 0.5.w,
                ),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 15.sp,overflow: TextOverflow.ellipsis,),maxLines: 1,
                  ),
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
                Expanded(
                  child: Text(
                    specialist,
                    style: TextStyle(fontSize: 15.sp,overflow: TextOverflow.ellipsis,),maxLines: 1,
                  ),
                ),
              ],
            ),


            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                RatingBarIndicator(
                  rating:review,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 16.sp,
                  direction: Axis.horizontal,
                ),

                Text("(${review.toInt()}/5)",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 1.h),
            AppButton(
              borderRadius: BorderRadius.circular(17.sp),
              onPressed: (){
                push(context, ChooseAppointmentScreen());
            }, label: S().bookNow,
              bgColor: AppColors.primary
            ,margin: EdgeInsets.only(left:11.sp,right:11.sp,top: 2.sp,bottom: 8.sp),
              padding:  EdgeInsets.all(3.sp),
            )
          ],
        ),
      ),
    );
  }
}
