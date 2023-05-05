import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key, required this.userImage, required this.onTap}) : super(key: key);
final String userImage;
final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          AppImage(
            imageUrl:  userImage, width: 45.sp, height: 45.sp,
            bottomLeftRadius: 60.sp,
            bottomRightRadius: 60.sp,
            topRightRadius: 60.sp,
            topLeftRadius: 60.sp,

          ),

          InkWell(
            onTap:onTap,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    color: AppColors.text
                ),
                padding: EdgeInsets.all(13.sp),
                child:  AppSVG(assetName: "photo_camera_interface_symbol_for_button",height: 15.sp,width: 15.sp,)),
          ),
        ],
      ),
    );

  }
}
