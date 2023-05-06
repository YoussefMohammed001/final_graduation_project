import 'package:final_graduation_project/features/doctor/doctor_appointmets/presentation/widgets/doctor_appointments_item.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/apppointment_app_bar.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/switch.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
   DoctorAppointmentsScreen({Key? key}) : super(key: key);
TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [

          const ApppointmentAppBar(),
          SwitchAppointment(current: () {  }, previous: () {  },),
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
                          DoctorAppointmentItems()
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
