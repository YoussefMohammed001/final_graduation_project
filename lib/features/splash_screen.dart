import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/user/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double buttonOpacity = 0;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 3000)).then((value) {
      // if (MyShared.isFirstOpen()) {
      //   // pushReplacement(context, OnBoardingScreen());
      //   pushReplacement(context, BlocProvider(
      //     create: (context) => LoginCubit(),
      //     child: const LoginScreen(),
      //   ));
      //   return;
      // }

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
    return Scaffold(
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
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      child: AppSVG(

                        height: logoHeight,
                        width: logoWidth, assetName: 'splash',
                      ),
                    ),
                    SizedBox(width: 5.w,),
                    AnimatedOpacity(
                        duration:  Duration(milliseconds: 500),
                        curve: Curves.bounceInOut,
                        opacity: buttonOpacity,
                        child: Text("HSPC",style: TextStyle(fontSize: 25.sp,color: AppColors.primary,fontWeight: FontWeight.bold),))

                  ],
                ),
              ),
            ],
          ),
          AnimatedContainer(
              height: bottomHeight,
              width: bottomWidth,
              curve: Curves.bounceOut,
              duration: const Duration(milliseconds: 1000),
              child: const AppSVG(
                boxFit: BoxFit.fill,
                assetName: "splash_corner",
              ))
        ],
      ),
    );
  }

  void navigate() {
    if (MyShared.isFirstOpen()) {
      // pushAndRemoveUntil(context, const OnBoardingScreen());
      return;
    }

    if (MyShared
        .getString(key: MySharedKeys.apiToken)
        .isEmpty) {
      // pushAndRemoveUntil(context, const SignInScreen());
    } else {
      // pushAndRemoveUntil(context, const MainScreen());
    }
  }
}
