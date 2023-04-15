import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/pages/single_doctor.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/data/specialize_doctors_model.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/presentation/manager/specialize_doctors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpecialistDoctors extends StatefulWidget {
  const SpecialistDoctors({Key? key, required this.id, required this.title}) : super(key: key);
final String id;
final String title;
  @override
  State<SpecialistDoctors> createState() => _SpecialistDoctorsState();
}

class _SpecialistDoctorsState extends State<SpecialistDoctors> {
  final cubit = SpecializeDoctorsCubit();

  @override
  void initState() {
    cubit.getDoctors(id: widget.id);
    // TODO: implement initState
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
                  title: widget.title,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 1.h,
                                        child: GridView.builder(
                                          shrinkWrap: false,
                                          itemBuilder: (BuildContext context,
                                              int index) {
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
                                                            .id));
                                              },
                                            );
                                          },
                                          itemCount: cubit.specializeDoctorData.length,
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
