import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/screens/add_clinc_images.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/screens/add_clinic_data.dart';
import 'package:final_graduation_project/features/doctor/send_licence/presentation/screens/post_licence_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {


  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {


        setState(() {});
      },
    );

    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: LayoutBuilder(
          builder: (context, constrains) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constrains.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 18.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppSVG(
                            height: 45.sp,
                            width: 45.sp,
                            assetName: 'done',
                          ),
                          Text(
                            "Registeration Done",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "Your request is pending now, we will mail you when you are accepted ",
                            style: TextStyle(
                              color: Colors.yellow[500],
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          AppButton(
                            textColor: AppColors.primary,
                            bgColor: Colors.white,
                            borderRadius: BorderRadius.circular(15.sp),
                            margin: EdgeInsets.all(0.sp),
                            onPressed: () {
                              push(context, PostLicenceScreen());
                            },
                            padding: EdgeInsets.all(15.sp),
                            label: "Didn't send license",
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppButton(
                            textColor: AppColors.primary,
                            bgColor: Colors.white,
                            margin: EdgeInsets.all(0.sp),
                            borderRadius: BorderRadius.circular(15.sp),
                            onPressed: () {
                              push(context, AddClinicData());

                            },
                            padding: EdgeInsets.all(15.sp),

                            label: "Didn't send doctor details",
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          AppButton(
                            textColor: AppColors.primary,
                            bgColor: Colors.white,
                            margin: EdgeInsets.all(0.sp),
                            borderRadius: BorderRadius.circular(15.sp),
                            onPressed: () {
                              push(context, AddClinicImages());
                            },
                            label: "Didn't send clinic images",
                            padding: EdgeInsets.all(15.sp),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
