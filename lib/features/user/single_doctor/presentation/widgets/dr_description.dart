import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrDescription extends StatelessWidget {
  const DrDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          Text(

          "Here is a description of the clinic Here is a description of the clinic Here is a description of the clinic Here is a description of the clinic Here is a description ofthe clinic Here is a description of the clinic"
          ,
            style: TextStyle(fontSize: 16.sp,),

          ),
        ],
      ),
    );
  }
}
