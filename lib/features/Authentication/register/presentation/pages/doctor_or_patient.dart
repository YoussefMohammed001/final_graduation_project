import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/widgets/i_am_widget.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DoctorOrPatientScreen extends StatefulWidget {
  const DoctorOrPatientScreen({Key? key}) : super(key: key);

  @override
  State<DoctorOrPatientScreen> createState() => _DoctorOrPatientScreenState();
}

class _DoctorOrPatientScreenState extends State<DoctorOrPatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constrains.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 23.sp,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    const Center(child: AppSVG(assetName: "splash")),
                    SizedBox(height: 3.h,),
                    Text("Let's get acquainted",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18.sp),),
                  SizedBox(height: 5.h,),
                    IAmItem(
                      icon: 'patient',
                      title: 'I am a patient',
                      containerColor:MyShared.getBoolean(key: MySharedKeys.isDoctor)  ? Colors.grey.shade200:AppColors.primary,
                      iconColor: MyShared.getBoolean(key: MySharedKeys.isDoctor) ? Colors.black : Colors.white,
                      onTap: () {
                        MyShared.putBoolean(
                            key: MySharedKeys.isDoctor, value: false);
                        print(MyShared.getBoolean(key: MySharedKeys.isDoctor));
                        setState(() {});
                        
                      }, titleColor: MyShared.getBoolean(key: MySharedKeys.isDoctor) == true ? Colors.black:AppColors.primary,
                    ),
                    IAmItem(
                      icon: 'doctor',
                      title: 'I am a doctor',
                      containerColor: MyShared.getBoolean(key: MySharedKeys.isDoctor)  ? AppColors.primary : Colors.grey.shade200,
                      iconColor: MyShared.getBoolean(key: MySharedKeys.isDoctor) ? Colors.white : Colors.black,
                      onTap: () {
                        MyShared.putBoolean(
                            key: MySharedKeys.isDoctor, value: true);
                        print(MyShared.getBoolean(key: MySharedKeys.isDoctor) ==
                            true);
                        setState(() {});

                      }, titleColor: MyShared.getBoolean(key: MySharedKeys.isDoctor) == true  ? AppColors.primary :Colors.black,
                    ),

                    Spacer(),
                    AppButton(
                      onPressed: () {
                          push(context, LoginScreen());
                        },
                      label: S().next,
                      bgColor: AppColors.primary,
                      margin: EdgeInsets.symmetric(horizontal:17.sp),
                      padding: EdgeInsets.all(17.sp),
                      borderRadius: BorderRadius.circular(15.sp),),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
