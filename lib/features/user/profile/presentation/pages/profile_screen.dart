
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/user/FAQS/presentation/screens/user_faqs.dart';
import 'package:final_graduation_project/features/user/about_us/presentation/screens/about_us_screen.dart';
import 'package:final_graduation_project/features/user/contact_us/presentation/screens/contact_us_screen.dart';
import 'package:final_graduation_project/features/user/profile/presentation/manager/profile_cubit.dart';
import 'package:final_graduation_project/features/user/profile/presentation/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/profile/presentation/widgets/profile_item.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/pages/profile_details_screen.dart';
import 'package:final_graduation_project/features/user/terms_and_conditions/presentations/screens/terms_and_conditions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is ProfileLoading){
          showLoading();
          
        } if(state is ProfileLogoutSucsess){
          hideLoading();
          showSuccess(state.sucsessMessage);
          pushAndRemoveUntil(context,const LoginScreen());
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
          ProfileItem(text: 'About Us', icon: 'ic_ic_account', onTap: () {
            push(context, const AboutUsScreen());
          },),
          ProfileItem(text: 'Language', icon: 'ic_ic_lang', onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 27.h,
                  margin: EdgeInsets.all(20.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 5.h,),

                      Text("Change Language",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                      SizedBox(height: 3.h,),


                      AppButton(
                        margin: EdgeInsets.all(8.sp),
                        onPressed: (){
                        //  this.context.read<LanguageCubit>().changeLanguageToEn();

                        }, label:MyShared.getCurrentLanguage() == 'en' ?  "Arabic" :"English",bgColor: AppColors.primary,),
                      SizedBox(height: 3.h,),
                      Center(child: InkWell(
                          onTap: (){
                            pop(context);
                            },
                          child: const Text("Back")))

                    ],
                  ),
                );
              },
            );

          },),
          ProfileItem(text: 'Terms and Conditions', icon: 'ic_ic_terms', onTap: () {
            push(context,             const TermsAndConditionScreen());
          },),
          ProfileItem(text: 'FAQS', icon: 'ic_ic_terms', onTap: () {
            push(context, const UserFAQS());
          },),
          ProfileItem(text: 'Contact Us', icon: 'ic_ic_contact', onTap: () {
            push(context, const ContactUsScreen());
          },),

        ],
      ),
    );
  }
}
