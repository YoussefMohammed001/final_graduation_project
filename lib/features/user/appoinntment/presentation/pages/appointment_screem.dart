import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/apppointment_app_bar.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/doctor_item.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/switch.dart';
import 'package:flutter/material.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
            children: [
              const ApppointmentAppBar(),
              SwitchAppointment(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: false,
                  itemBuilder: (BuildContext context, int index) {
                  return const DoctorItem();

                },
                itemCount: 10,
                ),
              )
            ],
          ),
    );
  }
}
