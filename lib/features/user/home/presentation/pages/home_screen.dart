import 'package:final_graduation_project/core/cubits/notifications/new_notifications_cubit.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/diabetes_prediction/presentation/screens/diabetesPprediction_screen.dart';
import 'package:final_graduation_project/features/user/heart_rediction/presentation/screens/heart_rediction_screen.dart';
import 'package:final_graduation_project/features/user/home/data/home_model.dart';
import 'package:final_graduation_project/features/user/home/presentation/manager/home_cubit.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:final_graduation_project/core/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/predict_diseases_item.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/sepcialest_item.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/pages/single_doctor.dart';
import 'package:final_graduation_project/features/user/skin_cancer_prediction/presentation/screens/skin_cancer_prediction_screen.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/presentation/screens/specialist_doctors.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
final notify = NewNotificationsCubit();
  final cubit = HomeCubit();
  bool visible = false;
  @override
  void initState() {
    cubit.getHome();
    notify.getNotifications();
    safePrint(MyShared.getString(key: MySharedKeys.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => cubit,
),
    BlocProvider(
      create: (context) => notify,
    ),
  ],
  child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeSuccess) {
            visible = !visible;
            print(visible);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                HomeAppBar(
                  userImage: MyShared.getString(key: MySharedKeys.patientImage),
                  searchController: searchController,
                  user: MyShared.getString(key: MySharedKeys.username), notify: notify.notifications.length,
                ),
                Visibility(
                  visible: visible,
                  child: Expanded(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          PredictDiseases(
                                            image:
                                                'assets/images/h.jpg',
                                            title: S().heartDiseases,
                                            onTap: () {
                                              push(context,
                                                  HeartPredictionScreen());
                                            },
                                          ),
                                          PredictDiseases(
                                            image:
                                                'assets/images/d.jpg',
                                            title: S().diabetes,
                                            onTap: () {
                                              push(context,
                                                  DiabetesPredictionScreen());
                                            },
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          PredictDiseases(
                                            image:
                                                'assets/images/s.jpg',
                                            title: S().skinCancer,
                                            onTap: () {
                                              push(context, SkinCancerScreen());
                                            },
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
                                            // Text(
                                            //   S().viewAll,
                                            //   style: TextStyle(
                                            //       fontSize: 15.sp,
                                            //       color: AppColors.primary,
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 51.sp,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: cubit.specializes.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            Specializes specializes =
                                                cubit.specializes[index];
                                            return SpecialistItem(
                                              icon: specializes.img,
                                              title:
                                                  specializes.name.toString(),
                                              doctorsNumber: specializes
                                                  .numberOfDoctors
                                                  .toString(),
                                              onTap: () {
                                                push(
                                                    context,
                                                    SpecialistDoctors(
                                                      id: specializes.id,
                                                      title: specializes.name,
                                                    ));
                                              },
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
                                              S().bestDoctors,
                                              style: TextStyle(
                                                  fontSize: 19.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            // Text(
                                            //   S().viewAll,
                                            //   style: TextStyle(
                                            //       fontSize: 15.sp,
                                            //       color: AppColors.primary,
                                            //       fontWeight: FontWeight.bold),
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 27.h,
                                        child: ListView.builder(
                                          itemCount: cubit.doctors.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            Doctors doctors =
                                                cubit.doctors[index];
                                            return DoctorItem(
                                              img: doctors.profile,
                                              name: doctors.name,
                                              specialist: doctors.specialize,
                                              review: doctors.rating.toDouble(),
                                              onTap: () {
                                                push(
                                                    context,
                                                    SingleDoctor(
                                                      id: doctors.id, img: doctors.profile,
                                                    ));
                                                safePrint(doctors.id);
                                              },
                                              id: doctors.id,
                                              doctorSpecialist:
                                                  doctors.specialize,


                                              doctorImg: doctors.profile,
                                              doctorName: doctors.name,
                                              doctorPrice: doctors.fees.toString(),
                                            );
                                          },
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
                ),
              ],
            ),
          );
        },
      ),
);
  }
}
