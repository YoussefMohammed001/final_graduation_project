import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrLocation extends StatelessWidget {
  const DrLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Location",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          Text(
"this for location,this for location this for location this for location"
            ,
            style: TextStyle(fontSize: 16.sp,),

          ),
          
          Container(
              margin: EdgeInsets.symmetric(vertical: 15.sp,horizontal: 15.sp),
              child: Image.asset("assets/images/loc_png.png"))

        ],
      ),
    );

  }
}
