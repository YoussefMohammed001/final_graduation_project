import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CircleAvatar(
            radius: 40.sp,
            backgroundImage: const NetworkImage('https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',),
          ),

          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.sp),
                  color: AppColors.text
              ),
              padding: EdgeInsets.all(13.sp),
              child: const AppSVG(assetName: "photo_camera_interface_symbol_for_button")),
        ],
      ),
    );

  }
}
