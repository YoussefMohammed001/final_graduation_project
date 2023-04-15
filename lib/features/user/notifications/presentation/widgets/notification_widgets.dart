import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.title, required this.time}) : super(key: key);
final String title;
final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 15.sp),
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
          color: Colors.grey[200],

          borderRadius: BorderRadius.circular(17.sp)

      ),
      child: Column(
        children: [
          Text(title,style: TextStyle(fontSize: 16.sp,letterSpacing: 2.sp, height: 0.2.h ),),
          SizedBox(height: 1.h,),
          Row(children: [
            const AppSVG(assetName: "clock_notify"),
            SizedBox(width: 2.w,),
            Text(time,style: TextStyle(color: Colors.grey),),
          ],)
        ],
      ),
    );
  }
}
