
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/features/user/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/user/profile/presentation/manager/profile_cubit.dart';
import 'package:final_graduation_project/features/user/profile/presentation/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/profile/presentation/widgets/profile_item.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/pages/profile_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is ProfileLoading){
          showLoading();
        } if(state is ProfileLogoutSucsess){
          hideLoading();
          showSuccess(state.sucsessMessage);
          pushReplacement(context,const LoginScreen());
        }if(state is ProfileLogoutFailure){
          hideLoading();

        }
      },
      child: ListView(
        padding: EdgeInsets.all(0.sp),
        children: [
          const ProfileAppBar(),
          SizedBox(height: 3.h,),
          ProfileItem(text: 'My Account', icon: 'ic_ic_account', onTap: () {
            push(context, profileDetailsScreen());
          },),
          ProfileItem(text: 'About Us', icon: 'ic_ic_account', onTap: () {},),
          ProfileItem(text: 'Language', icon: 'ic_ic_lang', onTap: () {

          },),
          ProfileItem(
            text: 'Terms and Conditions', icon: 'ic_ic_terms', onTap: () {},),
          ProfileItem(text: 'Contact Us', icon: 'ic_ic_contact', onTap: () {},),
          ProfileItem(text: 'Share App', icon: 'ic_ic_share', onTap: () {},),
        ],
      ),
    );
  }
}
