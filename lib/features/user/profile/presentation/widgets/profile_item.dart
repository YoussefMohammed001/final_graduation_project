import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key, required this.text, required this.icon, required this.onTap}) : super(key: key);
  final String text;
  final String icon;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.sp,horizontal: 15.sp),
        margin: EdgeInsets.symmetric(horizontal: 17.sp,vertical: 10.sp
        ),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15.sp)
        ),
        width: double.infinity,
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              AppSVG(assetName: icon),
              SizedBox(width: 4.w,),
              Text(text,style: TextStyle(color: Colors.black,),),
            ],

          ),
        ),
      ),
    );
  }
}
