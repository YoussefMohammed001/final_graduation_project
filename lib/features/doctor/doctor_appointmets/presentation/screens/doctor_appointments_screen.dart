import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/features/doctor/doctor_appointmets/presentation/manager/doctor_appointments_cubit.dart';
import 'package:final_graduation_project/features/doctor/doctor_appointmets/presentation/widgets/doctor_appointments_item.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/apppointment_app_bar.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/data/pending_appointments_model.dart';

class DoctorAppointmentsScreen extends StatefulWidget {
  const DoctorAppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorAppointmentsScreen> createState() =>
      _DoctorAppointmentsScreenState();
}

class _DoctorAppointmentsScreenState extends State<DoctorAppointmentsScreen> {
  TextEditingController searchController = TextEditingController();
  final doctorAppointmentsCubit = DoctorAppointmentsCubit();

  @override
  void initState() {
    MyShared.putBoolean(key: MySharedKeys.currentAppointment, value: true);
    doctorAppointmentsCubit.getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => doctorAppointmentsCubit,
      child: BlocBuilder<DoctorAppointmentsCubit, DoctorAppointmentsState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                const ApppointmentAppBar(),
                SwitchAppointment(
                  current: () {
                    setState(() {
                      current = true;
                      MyShared.putBoolean(
                          key: MySharedKeys.currentAppointment, value: true);
                      doctorAppointmentsCubit.getAppointments();
                    });
                  },
                  previous: () {
                    setState(() {
                      MyShared.putBoolean(
                          key: MySharedKeys.currentAppointment, value: false);
                      current = false;
                      doctorAppointmentsCubit.getAppointments();
                    });
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, int index) {
                      Data patientAppointments =
                          doctorAppointmentsCubit.appointments[index];
                      return DoctorAppointmentItems(
                        name:patientAppointments.name ,
                        phone: patientAppointments.phone,
                        day: patientAppointments.dayDate,
                        date: patientAppointments.time, note: patientAppointments.note,
                      );
                    },
                    itemCount: doctorAppointmentsCubit.appointments.length,
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
