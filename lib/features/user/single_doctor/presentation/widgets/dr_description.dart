import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DrDescription extends StatelessWidget {
  const DrDescription({Key? key, required this.about}) : super(key: key);
final String about;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S().description,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          Text(
          about,
            style: TextStyle(fontSize: 16.sp,),

          ),
        ],
      ),
    );
  }
}
