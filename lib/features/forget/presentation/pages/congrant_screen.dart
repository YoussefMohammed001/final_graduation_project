import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/login/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CongratsScreen extends StatefulWidget {
  const CongratsScreen({Key? key}) : super(key: key);

  @override
  State<CongratsScreen> createState() => _CongratsScreenState();


}

class _CongratsScreenState extends State<CongratsScreen> {
  @override
  void initState() {
    super.initState();


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
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.bounceOut,
                      child: Image.asset(
                        "assets/images/shield.png",
                        height: 30.h,
                        width: 60.w,
                      ),
                    ),
                    Text("Congrats!", style: TextStyle(color: AppColors.primary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 2.h,),
                    const Text("You have successfully change password",
                      style: TextStyle(color: Colors.grey),),
                    const Text("Please use the new password when logging in",
                      style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 3.h,),
                    AppButton(

                      bgColor: AppColors.primary,
                        borderRadius: BorderRadius.circular(15.sp),
                        margin: EdgeInsets.symmetric(horizontal: 38.sp),
                        onPressed: () {
                          pushReplacement(context, BlocProvider(
                            create: (context) => LoginCubit(),
                            child: const LoginScreen(),
                          ));
                        }, label: "Back To Login")
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
