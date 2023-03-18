import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpecialistItem extends StatelessWidget {
  const SpecialistItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.doctorsNumber,
  }) : super(key: key);

  final String icon;
  final String title;
  final String doctorsNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41.sp,
      padding: EdgeInsets.symmetric(
        horizontal: 15.sp,
        vertical: 10.sp,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10.sp,
        vertical: 15.sp,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(13.sp),
          color: Colors.white),
      child: InkWell(
        onTap: () {
          print("x");
        },
        child: Column(
          children: [
            AppImage(
              height: 35.sp,
              width: 35.sp,
              imageUrl: icon,

            ),
            SizedBox(height: 10.sp),
            Expanded(
              child: Text(
                title,

                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Text(
              "$doctorsNumber doctors",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            SizedBox(height: 10.sp),
          ],
        ),
      ),
    );
  }
}
