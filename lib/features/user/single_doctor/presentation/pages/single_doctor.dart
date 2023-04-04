import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/features/user/book_appointment/preseentation/screens/book_appointment_screen.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/widgets/dr_description.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/widgets/dr_location.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/widgets/dr_profile.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/widgets/single_doctor_head.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingleDoctor extends StatelessWidget {
  const SingleDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constrains) => SingleChildScrollView(
      child: ConstrainedBox(
      constraints: BoxConstraints(
      minHeight: constrains.maxHeight,
    ),
    child: IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Column(
            children: [
              const SingleDoctorHead(),
              const DrProfile(),
              Divider(

                height: 10.sp,
                thickness: 12.sp,
                color: Colors.grey.shade200,
              ),
              const DrDescription(),
              Divider(

                height: 10.sp,
                thickness: 12.sp,
                color: Colors.grey.shade200,
              ),
              const DrLocation(),
              Divider(

                height: 10.sp,
                thickness: 12.sp,
                color: Colors.grey.shade200,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.all(12.sp),
                child: AppButton(
                  bgColor: AppColors.primary,
                  onPressed: () {
                    push(context, BookAppointmentScreen());
                }, label: S().bookNow,),
              ),
            ],
          ),

        ],
      ),
    )))
      ));
  }
}
