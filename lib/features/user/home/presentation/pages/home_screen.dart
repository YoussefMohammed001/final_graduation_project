import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/features/user/diabetes_prediction/presentation/screens/diabetesPprediction_screen.dart';
import 'package:final_graduation_project/features/user/heart_rediction/presentation/screens/heart_rediction_screen.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:final_graduation_project/core/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/predict_diseases_item.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/sepcialest_item.dart';
import 'package:final_graduation_project/features/user/skin_cancer_prediction/presentation/screens/skin_cancer_prediction_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppBar(
            userImage:
            'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
            searchController: searchController,
            user: 'ahmed',
          ),

          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constrains.maxHeight,
                        ),

                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 13.sp, horizontal: 12.sp),
                                child: Row(
                                  children: [
                                    Text(
                                      S().wantToPredictOneOfTheseDiseases,
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
                                children: [
                                  PredictDiseases(
                                    image: 'https://images.unsplash.com/photo-1576169210859-6796c4b93c32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZGlhYmV0ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                    title: S().heartDiseases,
                                    onTap: () {
                                      push(context, HeartPredictionScreen());
                                    },
                                  ),
                                  PredictDiseases(
                                    image: 'https://images.unsplash.com/photo-1576169210859-6796c4b93c32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZGlhYmV0ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                    title: S().diabetes,
                                    onTap: () {
                                      push(context, DiabetesPredictionScreen());
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  PredictDiseases(
                                    image: 'https://images.unsplash.com/photo-1576169210859-6796c4b93c32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZGlhYmV0ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                    title: S().skinCancer,
                                    onTap: () {
                                      push(context, SkinCancerScreen());
                                    },
                                  ),
                                  PredictDiseases(
                                    image: 'https://images.unsplash.com/photo-1576169210859-6796c4b93c32?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZGlhYmV0ZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                    title: '',
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 13.sp, horizontal: 12.sp),
                                child: Row(
                                  children: [
                                    Text(
                                      S().specialists,
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
                                height: 51.sp,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 8,
                                  itemBuilder: (BuildContext context, int index) {
                                    return const SpecialistItem(
                                      icon: "heart",
                                      title: "Heart Issue",
                                      doctorsNumber: "20 Doctors",
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
                                      S().nearestDoctors,
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
                              SizedBox(
                                height: 1.h,
                              ),
                            ],
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
