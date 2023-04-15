import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingleDoctorHead extends StatelessWidget {
  const SingleDoctorHead({Key? key, required this.count, required this.img}) : super(key: key);
  final int count;
  final String img;

  @override
  Widget build(BuildContext context) {
    return    Stack(
      alignment: AlignmentDirectional.topStart,
      children: [

        CarouselSlider.builder(

          itemCount: count,
          itemBuilder: (BuildContext context, int itemIndex,
              int pageViewIndex) {

            return AppImage(
              width: double.infinity,
              height: 17.h,
              imageUrl: img,
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 25.sp,left: 10.sp,right: 10.sp),
          child: InkWell(

              onTap: (){
                pop(context);
              },
              child:  AppSVG(assetName: "ic_ic_dropdown_back_copy_3",height: 5.h,width: 2.w,)),
        ),

      ],
    );

  }
}
