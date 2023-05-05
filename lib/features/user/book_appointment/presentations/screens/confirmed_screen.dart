import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/user/main_screen/main_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmedScreen extends StatefulWidget {
  const ConfirmedScreen({Key? key, required this.from, required this.to}) : super(key: key);
final String from;
final String to;
  @override
  State<ConfirmedScreen> createState() => _ConfirmedScreenState();
}

class _ConfirmedScreenState extends State<ConfirmedScreen> {
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
          Column(
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
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
                opacity: buttonOpacity,
                child: Text(
                  S().reservationDone,
                  style:  TextStyle(color: Colors.white,fontSize: 17.sp),
                ),
              ),
              SizedBox(height: 2.h,),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeIn,
                opacity: buttonOpacity,
                child: Text(

                  "Your appointment from ${widget.from} to ${widget.to}",
                  style:  TextStyle(color: Colors.yellow[500],fontSize: 17.sp,fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 1300),
                curve: Curves.bounceOut,
                opacity: buttonOpacity,
                child: AppButton(
                  textColor: AppColors.primary,
                  bgColor: Colors.white,
                  borderRadius: BorderRadius.circular(15.sp),
                  margin: EdgeInsets.symmetric(horizontal: 38.sp),
                  onPressed: () {
                    pushReplacement(context,  MainScreen());
                  },

                  label: S().backToHome,),
              )
            ],
          ),
        ],
      ),
    );
  }
}
