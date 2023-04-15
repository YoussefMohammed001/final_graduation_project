import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/choose_appointment.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseAppointmentScreen extends StatelessWidget {
  const ChooseAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
              title: S().chooseYourAppointment,
            ),
            Expanded(
              child: LayoutBuilder(
                  builder: (context, constrains) => SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constrains.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Container(
                                margin: EdgeInsets.all(17.sp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(S().chooseYourAppointment,style:  TextStyle(color: AppColors.primary,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                                    SizedBox(height: 3.h,),
                                    Expanded(
                                      child: SizedBox(
                                        height: 1.h,
                                        child: GridView.builder(
                                          gridDelegate:
                                               SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                                  mainAxisSpacing:10,
                                                  crossAxisSpacing: 10,
                                                  childAspectRatio: 5.sp
                                          ),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return const AppointmentItem(
                                              from: '10:00',
                                              day: 'monday',
                                              to: '9:00',
                                            );
                                          },
                                          itemCount: 10,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
