import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();
}

class _CongratsScreenState extends State<CongratsScreen> {
  double logoHeight = 5.h;
  double logoWidth = 2.5.w;

  double buttonOpacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        logoHeight = 10.h;
        logoWidth = 20.w;

        setState(() {});
      },
    );

    Future.delayed(
      const Duration(milliseconds: 2000),
      () {
        buttonOpacity = 1;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          const AppSVG(assetName: "assets/images/splash_corner.svg"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      height: logoHeight,
                      width: logoWidth,
                      duration: const Duration(milliseconds: 1500),
                      curve: Curves.bounceOut,
                      child: AppSVG(
                        height: logoHeight,
                        width: logoWidth, assetName: 'done',
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      S().congrats,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                     Text(
                      S().youHaveSuccessfullyChangePassword,
                      style: const TextStyle(color: Colors.grey),
                    ),
                     Text(
                      S().pleaseUseTheNewPasswordWhenLoggingIn,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      opacity: buttonOpacity,
                      child: AppButton(
                        textColor: AppColors.primary,
                        bgColor: Colors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                          margin: EdgeInsets.symmetric(horizontal: 38.sp),
                          onPressed: () {
                            pushReplacement(context, const LoginScreen());
                          },

                          label: S().backToLogin,),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
