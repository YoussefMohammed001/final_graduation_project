import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/presentation/screens/specialist_doctors.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpecialistItem extends StatelessWidget {
  const SpecialistItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.doctorsNumber, required this.onTap,
  }) : super(key: key);

  final String icon;
  final String title;
  final GestureTapCallback  onTap;
  final String doctorsNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47.sp,
      padding: EdgeInsets.symmetric(
        horizontal: 15.sp,
        vertical: 15.sp,
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
        onTap: onTap,
        child: Column(
          children: [
            Image.network(
              height: 27.sp,
              width: 27.sp,
                icon,

            ),
            Spacer(),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.text,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 1.h,),
            Text(doctorsNumber,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
