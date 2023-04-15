import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IAmItem extends StatelessWidget {
  const IAmItem({Key? key, required this.icon, required this.title, required this.containerColor, required this.iconColor, required this.onTap}) : super(key: key);
final String icon;
final String title;
final Color containerColor;
final Color iconColor;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13.sp),
        margin: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 10.sp),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15.sp)
        ),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(13.sp),
                margin: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(15.sp)
                ),
                child: AppSVG(assetName: icon,color: iconColor,)),
            Text(title)
          ],
        ),
      ),
    );
  }
}
