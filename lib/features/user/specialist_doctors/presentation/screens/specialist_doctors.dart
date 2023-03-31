import 'package:final_graduation_project/features/user/specialist_doctors/presentation/widgets/app_bar.dart';
import 'package:final_graduation_project/features/user/specialist_doctors/presentation/widgets/specialist_doctor_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SpecialistDoctors extends StatelessWidget {
  const SpecialistDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 5.sp),
        child: Column(
          children: [
            const SpecialistDoctorsAppBar(),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(bottom: 15.sp),
                shrinkWrap: true,
                itemCount: 8,

                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                  mainAxisSpacing: 20.sp,
                  childAspectRatio: 1/1,
                  crossAxisSpacing: 15.sp,
                ), itemBuilder: (BuildContext context, int index) {
                return   const SpictialestDoctorsItem();

              },),
            ),


          ],
        ),
      ),
    );
  }
}
