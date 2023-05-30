import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/pages/single_doctor.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/data/specialize_doctors_model.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/presentation/manager/specialize_doctors_cubit.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/presentation/screens/specialist_doctors.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PredictionResultScreen extends StatefulWidget {
  const PredictionResultScreen(
      {Key? key,
      required this.appBarTitle,
      required this.result,
      required this.id, })
      : super(key: key);
  final String appBarTitle;
  final String result;
  final String id;


  @override
  State<PredictionResultScreen> createState() => _PredictionResultScreenState();
}

class _PredictionResultScreenState extends State<PredictionResultScreen> {
  final cubit = SpecializeDoctorsCubit();
  @override
  void initState() {
    // TODO: implement initState
    cubit.getDoctors(id: widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocBuilder<SpecializeDoctorsCubit, SpecializeDoctorsState>(
  builder: (context, state) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: widget.appBarTitle,
          ),
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
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  S().result,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15.sp),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 20.sp, horizontal: 30.sp),
                                    decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(13.sp)),
                                    child: Padding(
                                      padding: EdgeInsets.all(15.sp),
                                      child: Center(
                                          child: Text(
                                        widget.result,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(

                                          color: Colors.white,
                                          fontSize: 18.sp,
                                        ),
                                      )),
                                    )),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20.sp),
                                    child: Center(
                                      child: Row(

                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.gpp_bad_outlined,color: Colors.red,),
                                          Text(S().accurate,

                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.bold
                                              ),
                                              textAlign: TextAlign.center),
                                        ],
                                      ),
                                    )),
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

                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 29.h,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: cubit.specializeDoctorData.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                          SpecializeDoctorData
                                          specializeDoctorData =
                                          cubit.specializeDoctorData[
                                          index];
                                          return DoctorItem(
                                            img: specializeDoctorData
                                                .profilePicture,
                                            name: specializeDoctorData.name,
                                            specialist: specializeDoctorData
                                                .specialize,
                                            review: specializeDoctorData
                                                .rating
                                                .toDouble(),
                                            onTap: () {
                                              push(
                                                  context,
                                                  SingleDoctor(
                                                    id: specializeDoctorData
                                                        .id, img: specializeDoctorData.profilePicture,));
                                            },
                                            id: specializeDoctorData.id,
                                            doctorSpecialist: specializeDoctorData.specialize,
                                            doctorImg: specializeDoctorData.profilePicture,
                                            doctorName: specializeDoctorData.name,
                                            doctorPrice: specializeDoctorData.rating.toString(),
                                          );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                )
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
  },
),
);
  }
}
