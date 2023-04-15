
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
import 'package:final_graduation_project/features/user/profile/presentation/widgets/chang_lang.dart';
import 'package:final_graduation_project/features/user/profile/presentation/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/profile/presentation/widgets/profile_item.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/pages/profile_details_screen.dart';
import 'package:final_graduation_project/features/user/terms_and_conditions/presentations/screens/terms_and_conditions_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
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
          ProfileItem(text: S().myAccount, icon: 'ic_ic_account', onTap: () {
            push(context, profileDetailsScreen());
          },),
          ProfileItem(text: S().aboutUs, icon: 'ic_ic_account', onTap: () {
            push(context, const AboutUsScreen());
          },),
          ProfileItem(text: S().language, icon: 'ic_ic_lang', onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return ChangeLangItem();
              },
            );

          },),
          ProfileItem(text: S().termsAndConditions, icon: 'ic_ic_terms', onTap: () {
            push(context,             const TermsAndConditionScreen());
          },),
          ProfileItem(text: S().faqs, icon: 'ic_ic_terms', onTap: () {
            push(context, const UserFAQS());
          },),
          ProfileItem(text: S().contactUs, icon: 'ic_ic_contact', onTap: () {
            push(context, const ContactUsScreen());
          },),

        ],
      ),
    );
  }
}
