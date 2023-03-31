import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/Authentication/on_boarding/presentaion/pages/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({Key? key, required this.title, required this.subTitle, required this.image, required this.onPressed, required this.onTap}) : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  final GestureTapCallback onTap;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) =>
      SingleChildScrollView(  child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: constrains.maxHeight,
        ),
        child: IntrinsicHeight(
          child: Column(

            children: [
               Stack(
                 children: [
                   SizedBox(
                     height: 75.h,
                      width: double.infinity,
                      child: Image.asset(image.toString(),fit: BoxFit.fill,),),
                   InkWell(
                     onTap: (){
                       pushAndRemoveUntil(context, const LoginScreen());
                     },
                     child: Visibility(
                       visible: !lastPage,
                       child: Container(
                           margin: EdgeInsets.symmetric(vertical: 30.sp,horizontal: 15.sp),
                           child: Text("SKIP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.sp),)),
                     ),
                   )

                 ],
               ),
              Text("Manage your health and happy future",style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
              SizedBox(height: 2.h,),
              SmoothPageIndicator(
                controller: indicatorController,
                count: 3,
                effect: SwapEffect(
                    spacing: 12.0.sp,
                    dotWidth: 17.0.sp,
                    dotHeight: 17.0.sp,
                    strokeWidth: 1,
                    radius: 50.sp,
                    paintStyle: PaintingStyle.stroke,
                    dotColor: Colors.yellow.shade700,
                    activeDotColor: Colors.yellow.shade700),
              ),
              SizedBox(height: 2.h,),
              AppButton(bgColor: AppColors.primary,onPressed: () {
                lastPage ? pushAndRemoveUntil(context, const LoginScreen())
                    : indicatorController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }, label: lastPage ?'Lets Start' : "Next",)
            ],
          ),
        ),
      ),
    ));
  }
}




