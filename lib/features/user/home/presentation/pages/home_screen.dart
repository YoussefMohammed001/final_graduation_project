import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/predict_diseases_item.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/prediction_item.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/sepcialest_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
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
                    child: Column(
                      children: [
                        HomeAppBar(
                          userImage:
                              'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                          searchController: searchController,
                          user: 'ahmed',
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 13.sp, horizontal: 12.sp),
                          child: Row(
                            children: [
                              Text(
                                "Want to predict one of these disease?",
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            PredictDiseases(),
                            PredictDiseases(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            PredictDiseases(),
                            PredictDiseases(),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 13.sp, horizontal: 12.sp),
                          child: Row(
                            children: [
                              Text(
                                "Specialist",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 55.sp,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return const SpecialistItem(
                                icon: "fieldImg",
                                title: "specialists.fieldDtname",
                                doctorsNumber: "doctorCount.toString()",
                              );
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 13.sp, horizontal: 12.sp),
                          child: Row(
                            children: [
                              Text(
                                "Nearest Doctors",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                "View All",
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
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
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
