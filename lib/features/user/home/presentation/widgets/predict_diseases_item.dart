import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PredictDiseases extends StatelessWidget {
  const PredictDiseases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(13.sp),
        width: 30.w,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey.shade200
          ),
            borderRadius: BorderRadius.circular(17.sp)

        ),
        child: Column(
          children: [
            AppImage(
              imageUrl:
                  "https://media.istockphoto.com/id/610227072/photo/stethoscope-with-red-heart-on-a-wood-background.jpg?b=1&s=170667a&w=0&k=20&c=KUFFNlF0uxSEGAUmGSGYYusVKVtg1CWixI6a6ySmqGA=",
              width: double.infinity,
              height: 13.h,
              topLeftRadius: 17.sp,
              topRightRadius: 17.sp,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Heart Diseases"),
            ),
          ],
        ),
      ),
    );
  }
}
