import 'package:final_graduation_project/core/cubits/language/language_cubit.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/user/profile/presentation/manager/profile_cubit.dart';
import 'package:final_graduation_project/features/user/profile/presentation/widgets/log_out.dart';
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
          const Text("My Account",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
         const Spacer(),
          InkWell(
              onTap: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return LogOutItem(onTap: () {
                      MyShared.putString(key: MySharedKeys.currentLanguage, value: 'en');
                       this.context.read<ProfileCubit>().userLogout();

                    },);
                  },
                );              },
              child: const AppSVG(assetName: 'log_out'))
        ],

      ),
    );
  }
}
