import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/Authentication/on_boarding/presentaion/pages/on_boarding_screen.dart';
import 'package:final_graduation_project/features/doctor/doctor_main_screen/doctor_main_screen.dart';
import 'package:final_graduation_project/features/splash/presentation/manager/splash_cubit.dart';
import 'package:final_graduation_project/features/user/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double buttonOpacity = 0;
  final cubit = SplashCubit();


  @override
  void initState() {
    super.initState();
    cubit.getDoctorData();
    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      if (!MyShared.isLoggedIn()) {
        // pushReplacement(context, OnBoardingScreen());
        pushReplacement(context, OnBoardingScreen());
        return;
      }

      if (MyShared.isLoggedIn()) {
        pushReplacement(context, const MainScreen());
      } else {
        pushReplacement(context, const LoginScreen());
      }
    });
//.

    Future.delayed(
      const Duration(milliseconds: 1500),
          () {
        buttonOpacity = 1;
        setState(() {});
        logoHeight = 30.h;
        logoWidth = 30.w;

        bottomHeight = 50.h;
        bottomWidth = 40.w;

        setState(() {});
      },
    );
  }

  double logoHeight = 5.h;
  double logoWidth = 10.w;

  double bottomHeight = 35.h;
  double bottomWidth = 25.w;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: BlocListener<SplashCubit, SplashState>(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          height: logoHeight,
                          width: logoWidth,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceOut,
                          child: AppSVG(

                            height: logoHeight,
                            width: logoWidth, assetName: 'splash',
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.bounceInOut,
                            opacity: buttonOpacity,
                            child: Text("PHCP", style: TextStyle(
                                fontSize: 35.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold),))

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        listener: (context, state) {
          if(state is SplashSucsess){
            push(context, const DoctorMainScreen());
          }
        },
      ),
    );
  }

}
