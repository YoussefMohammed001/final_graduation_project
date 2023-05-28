import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PredictDiseases extends StatelessWidget {
  const PredictDiseases({Key? key, required this.image, required this.title,required this.onTap}) : super(key: key);
final String image;
final String title;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        margin: EdgeInsets.all(13.sp),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade200
          ),
            borderRadius: BorderRadius.circular(17.sp)

        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(17.sp),
                topRight: Radius.circular(17.sp),


              ),
              child: Image.asset(
                 fit: BoxFit.fill,
                    image,
                       width: double.infinity,
                height: 50.sp,

              ),
            ),
             Padding(
              padding: EdgeInsets.all(12.sp),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
