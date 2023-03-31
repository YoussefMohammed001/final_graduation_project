import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingleDoctorHead extends StatelessWidget {
  const SingleDoctorHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Stack(
      alignment: AlignmentDirectional.topStart,
      children: [

        CarouselSlider.builder(

          itemCount: 5,
          itemBuilder: (BuildContext context, int itemIndex,
              int pageViewIndex) {

            return AppImage(
              width: double.infinity,
              height: 17.h,
              imageUrl: 'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1600&q=60',
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
