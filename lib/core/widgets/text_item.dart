import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class TextItem extends StatelessWidget {
  const TextItem({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.sp),
      padding: EdgeInsets.all(17.sp),
      decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(17.sp)

      ),
      child: Text(title,style: TextStyle(letterSpacing: 2.sp, height: 0.2.h ),),
    );

  }
}