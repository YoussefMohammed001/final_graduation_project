import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
          top: 30.sp, left: 15.sp, right: 15.sp, bottom: 20.sp),
      color: AppColors.primary,
      child: Row(
        children: [
          InkWell(
              onTap: (){
                pop(context);
              },
              child: const AppSVG(assetName: "ic_ic_dropdown_back_copy_3")),
          SizedBox(
            width: 3.w,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

  }
}
