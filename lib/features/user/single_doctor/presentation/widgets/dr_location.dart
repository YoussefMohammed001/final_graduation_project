import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrLocation extends StatelessWidget {
   DrLocation({Key? key, required this.location}) : super(key: key);
final String location;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S().location,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          Text(location),
          SizedBox(height: 2.h,),

          Container(
              margin: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 15.sp),
              child: Image.asset("assets/images/loc_png.png"))

        ],
      ),
    );

  }
}
