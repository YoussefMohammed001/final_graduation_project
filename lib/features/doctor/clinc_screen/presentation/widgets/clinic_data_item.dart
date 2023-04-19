import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClinicDataItem extends StatelessWidget {
  const ClinicDataItem({Key? key, required this.icon, required this.text, required this.onTap}) : super(key: key);
final IconData icon;
final String text;
final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        margin: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(17.sp)
        ),

        height: 50.sp,
        width: double.infinity,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 22.sp
              ,),
            SizedBox(height: 1.h,),
            Text(text,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.sp
            ),),
          ],
        )),
      ),
    );

  }
}
