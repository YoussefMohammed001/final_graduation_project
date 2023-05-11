import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Shifttem extends StatelessWidget {
  const Shifttem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(15.sp),
          margin: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("start time"),
                  Text("8:00"),
                ],
              ),
              SizedBox(
                width: 2.w,
              ),
              VerticalDivider(
                color: Colors.blue,
                thickness: 4.w,

              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                children: [
                  Text("start time"),
                  Text("8:00"),
                ],
              ),
            ],
          ),
        ),
        Icon(Icons.close,color: Colors.blue,)
      ],
    );
  }
}
