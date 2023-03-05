import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/features/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2500)).then((value) {
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
        pushReplacement(context, BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ));
      }
    });

    Future.delayed(
      const Duration(milliseconds: 500),
          () {
        logoHeight = 50.h;
        logoWidth = 100.w;

        bottomHeight = 50.h;
        bottomWidth = 40.w;

        setState(() {});
      },
    );
  }

  double logoHeight = 25.h;
  double logoWidth = 75.w;

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
                child: AnimatedContainer(
                  height: logoHeight,
                  width: logoWidth,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceOut,
                  child: Image.asset(
                    "assets/images/bdg_logo.png",
                    height: logoHeight,
                    width: logoWidth,
                  ),
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
