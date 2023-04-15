import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/nearest_doctors_screen/data/nearest_model.dart';
import 'package:final_graduation_project/features/user/nearest_doctors_screen/presentation/manager/nereast_cubit.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/pages/single_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NearestDoctorScreen extends StatefulWidget {
  const NearestDoctorScreen({Key? key, required this.lat, required this.lang}) : super(key: key);
final String lat;
final String lang;

  @override
  State<NearestDoctorScreen> createState() => _NearestDoctorScreenState();
}

class _NearestDoctorScreenState extends State<NearestDoctorScreen> {
  final  cubit = NereastCubit();
  @override
  void initState() {

    cubit.getNearest(lat: widget.lat, lang: widget.lang);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<NereastCubit, NereastState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                const CustomAppBar(
                  title: 'Nearest Doctors',
                ),
                Expanded(
                  child: LayoutBuilder(
                      builder: (context, constrains) =>
                          SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: constrains.maxHeight,
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 1.h,
                                        child: GridView.builder(
                                          shrinkWrap: false,
                                          itemBuilder:
                                              (BuildContext context,
                                              int index) {
                                            NearestData near = cubit.nearestData[index];
                                            return DoctorItem(
                                              img: near.profilePicture,
                                              name: near.name,
                                              specialist: near.specialize,
                                              review: 2,
                                              onTap: () {
                                                push(context, SingleDoctor(id: near.id,));
                                              },
                                            );
                                          },
                                          itemCount: cubit.nearestData.length,
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10,
                                              childAspectRatio: 3.5.sp),
                                        ),
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
        },
      ),
    );
  }
}
