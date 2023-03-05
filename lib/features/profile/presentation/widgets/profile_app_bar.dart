import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/profile/presentation/manager/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 30.sp,bottom: 20.sp,left: 15.sp,right: 15.sp),
      color: AppColors.primary,
      child: Row(

        children: [
          Text("My Account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
         Spacer(),
          InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
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
                              onTap: (){
                                this.context.read<ProfileCubit>().userLogout();
                              },
                              child: Text("LOG OUT")))

                        ],
                      ),
                    );
                  },
                );              },
              child: AppSVG(assetName: 'log_out'))
        ],

      ),
    );
  }
}
