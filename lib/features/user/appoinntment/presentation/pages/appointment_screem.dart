import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/features/user/appoinntment/data/patient_appointments_model.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/manager/patients_appointmetns_cubit.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/apppointment_app_bar.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/doctor_item.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final cubit = PatientsAppointmetnsCubit();

  @override
  void initState() {
    cubit.getAppointemnts();
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
                SwitchAppointment(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, int index) {
                      PatientAppointments patientAppointments =
                          cubit.patientAppointments[index];
                      return DoctorItem(
                        location:
                            "${patientAppointments.city} - ${patientAppointments.placeNumber}",
                        drName: patientAppointments.name.toString(),
                        imgUrl: patientAppointments.doctorImg.url.toString(),
                        specialization:
                            patientAppointments.specialize.toString(),
                        day: patientAppointments.day,
                        rating: patientAppointments.rating.toDouble(),
                        text: patientAppointments.status,
                        color: patientAppointments.status == "accepted" ?  AppColors.primary :Colors.red, time: patientAppointments.time,
                      );
                    },
                    itemCount: cubit.patientAppointments.length,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
