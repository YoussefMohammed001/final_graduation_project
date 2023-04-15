import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogOutItem extends StatelessWidget {
  const LogOutItem({Key? key, required this.onTap}) : super(key: key);
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
   return Container(
      height: 35.h,
      margin: EdgeInsets.all(20.sp),
      child: Column(


        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppSVG(assetName: "log_out_blue",height: 8.h,),
          SizedBox(height: 5.h,),

          Text("Do you want to log out?",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 22.sp),),
          SizedBox(height: 3.h,),


          AppButton(
            margin: EdgeInsets.all(8.sp),
            onPressed: (){
              pop(context);
            }, label: "No, stay here",bgColor: AppColors.primary,),
          SizedBox(height: 3.h,),
          Center(child: InkWell(
              onTap: onTap,
              child: const Text("LOG OUT")))

        ],
      ),
    );
  }
}
