import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PredictionResultScreen extends StatelessWidget {
  const PredictionResultScreen({Key? key, required this.appBarTitle, required this.result, required this.description}) : super(key: key);
final String appBarTitle;
final String result;
final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
           CustomAppBar(title: appBarTitle,),
          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Container(

                        child: Column(

                          children:  [
                            SizedBox(height: 3.h,),

                            Text(S().result,style: TextStyle(color: Colors.black,fontSize: 20.sp,fontWeight: FontWeight.bold),),

                            Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(15.sp),
                                margin: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 30.sp),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(13.sp)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15.sp),
                                  child: Center(child: Text(result,style: TextStyle(color: Colors.white,fontSize: 18.sp,),)),
                                )),
                            SizedBox(height: 5.h,),

                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 20.sp),
                                child: Center(child: Text(description,style: TextStyle(color: Colors.grey,fontSize: 17.sp,),textAlign: TextAlign.center),)),
Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 13.sp, horizontal: 12.sp),
                              child: Row(
                                children: [
                                  Text(
                                    S().specializedDoctors,
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Spacer(),
                                  Text(
                                    S().viewAll,
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 29.h,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: const [
                                  LatestDoctorItem(),
                                  LatestDoctorItem(),
                                  LatestDoctorItem(),
                                  LatestDoctorItem(),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h,)
                          ],


                        ),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );

  }
}
