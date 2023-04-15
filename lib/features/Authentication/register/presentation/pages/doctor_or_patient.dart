import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/widgets/i_am_widget.dart';
import 'package:final_graduation_project/features/Authentication/register/presentation/pages/register_screen.dart';
import 'package:final_graduation_project/features/doctor/doctor_register_screen/presentation/screens/register_screen_doctor.dart';
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
                  SizedBox(height: 5.h,),
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
                      },
                    ),
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
                      },
                    ),
                    Spacer(),
                    AppButton(
                      onPressed: () {
                        if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == true){
                          push(context, RegisterScreenDoctor());
                        }
                        if(MyShared.getBoolean(key: MySharedKeys.isDoctor) == false){
                          push(context, RegisterScreen());
                        }
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
