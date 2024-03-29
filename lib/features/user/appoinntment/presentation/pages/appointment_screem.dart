import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/features/user/appoinntment/data/patient_appointments_model.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/manager/patients_appointmetns_cubit.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/apppointment_app_bar.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/doctor_item.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final cubit = PatientsAppointmetnsCubit();
late double value;
  @override
  void initState() {
    cubit.getAppointemnts();
    cubit.getOld();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<PatientsAppointmetnsCubit, PatientsAppointmetnsState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                const ApppointmentAppBar(),
                SwitchAppointment(
                  current: () {
                    current = true;
                    MyShared.putBoolean(
                      key: MySharedKeys.currentAppointment,
                      value: true,
                    );
                    safePrint(MyShared.getBoolean(
                        key: MySharedKeys.currentAppointment));
                    setState(() {});
                  },
                  previous: () {
                    MyShared.putBoolean(
                      key: MySharedKeys.currentAppointment,
                      value: false,
                    );
                    current = false;
                    safePrint(MyShared.getBoolean(
                      key: MySharedKeys.currentAppointment,
                    ));

                    setState(() {});
                  },
                ),


         Visibility(
                  visible: MyShared.getBoolean(
                        key: MySharedKeys.currentAppointment,
                      ) ==
                      true,
                  child: cubit.patientNewAppointments != null ? Expanded(
                    child: ListView.builder(
                      shrinkWrap: false,
                      itemBuilder: (BuildContext context, int index) {
                        PatientAppointments patientAppointments =
                            cubit.patientNewAppointments[index];
                        return DoctorItem(
                          onTap: () {


                          },
                          onRatingUpdate: (double rate) {


                          },
                          location:
                              "${patientAppointments.city} - ${patientAppointments.placeNumber}",
                          drName: patientAppointments.name.toString(),
                          imgUrl: patientAppointments.doctorImg.url.toString(),
                          specialization:
                              patientAppointments.specialize.toString(),
                          day: patientAppointments.day,
                          rating: patientAppointments.rating.toDouble(),
                          text: patientAppointments.status,
                          color: patientAppointments.status == "accepted"
                              ? AppColors.primary
                              : Colors.red,
                          time: patientAppointments.time,
                        );
                      },
                      itemCount: cubit.patientNewAppointments.length,
                    ),
                  ):
           Column(
           mainAxisAlignment: MainAxisAlignment
           .center,
           children: [
             SizedBox(height: 27.h,),
             const AppSVG(assetName: "empty"),
             SizedBox(height: 1.h,),
             const Text(
               "You don't have notifications",
               style: TextStyle(color: Colors.grey),
             )
           ],
         ),
                ),





           Visibility(
                  visible: MyShared.getBoolean(
                          key: MySharedKeys.currentAppointment) ==
                      false,
                  child:  cubit.patientOldAppointments != null   ?  Expanded(
                    child: ListView.builder(
                      shrinkWrap: false,
                      itemBuilder: (BuildContext context, int index) {
                        PatientAppointments patientAppointments =
                            cubit.patientOldAppointments[index];
                        return DoctorItem(
                          onTap: () {
                            pop(context);
                            cubit.addReview(
                              patientId: MyShared.getString(key: MySharedKeys.id),

                              doctorId: patientAppointments.id,
                              rate: value.toString(),
                            );
                          },
                          onRatingUpdate: (double rate) {
                            value = rate;
                            safePrint(value);

                          },
                          location:
                              "${patientAppointments.city} - ${patientAppointments.placeNumber}",
                          drName: patientAppointments.name.toString(),
                          imgUrl: patientAppointments.doctorImg.url.toString(),
                          specialization:
                              patientAppointments.specialize.toString(),
                          day: patientAppointments.day,
                          rating: patientAppointments.rating.toDouble(),
                          text: patientAppointments.status,
                          color: patientAppointments.status == "accepted"
                              ? AppColors.primary
                              : Colors.red,
                          time: patientAppointments.time,
                        );
                      },
                      itemCount: cubit.patientOldAppointments.length,
                    ),
                  ) :Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center,
                    children: [
                      SizedBox(height: 27.h,),
                      const AppSVG(assetName: "empty"),
                      SizedBox(height: 1.h,),
                      const Text(
                        "You don't have notifications",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
           ),
          ]),
          );
        },
      ),
    );
  }
}
