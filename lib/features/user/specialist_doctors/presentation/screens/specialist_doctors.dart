import 'package:final_graduation_project/features/user/home/presentation/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpecialistDoctors extends StatelessWidget {
  const SpecialistDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          const SpecialistDoctorsAppBar(),
          Expanded(
            child: GridView.builder(
              shrinkWrap: false,
              itemCount: 10,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                mainAxisSpacing: 25.sp,
                crossAxisSpacing: 0.sp,
            ), itemBuilder: (BuildContext context, int index) {
              return   const LatestDoctorItem();

            },),
          ),
          SizedBox(height: 2.h,)

        ],
      ),
    );
  }
}
