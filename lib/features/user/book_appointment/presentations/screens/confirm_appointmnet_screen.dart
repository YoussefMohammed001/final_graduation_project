import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/widgets/doctor_item.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/screens/confirmed_screen.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/appointment_item.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/appointment_text_form_filed.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/choose_appointment.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/doctor_item.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/patient_information_item.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class ConfirmAppointmentScreen extends StatefulWidget {
  const ConfirmAppointmentScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ConfirmAppointmentScreen> createState() =>
      _ConfirmAppointmentScreenState();
}

class _ConfirmAppointmentScreenState extends State<ConfirmAppointmentScreen> {
  TextEditingController patientNameController = TextEditingController();

  TextEditingController patientMobileController = TextEditingController();

  TextEditingController patientAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                                  children: [
                                    const DoctorItemConfirm(
                                      imageUrl:
                                          'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jdG9yfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=700&q=60',
                                      doctorName: 'Ahmed',
                                      doctorSpecialist: 'Cardiology',
                                      rate: 2.5,
                                      numberOfReviews: '5',
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    AppointmentItemConfrim(
                                      date: 'Monday',
                                      price: '150',
                                      timeFrom: '10:00 AM',
                                      timeTo: '5:00 PM',
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    PatientInformationItem(
                                      patientName: MyShared.getString(key: MySharedKeys.username),
                                      patientMobile:"0"+MyShared.getInt(key: MySharedKeys.phone).toString(),
                                      patientNameController:
                                          patientNameController,
                                      patientMobileController:
                                          patientMobileController,
                                      patientAddressController:
                                          patientAddressController,
                                    ),
                                    Spacer(),
                                    AppButton(
                                      onPressed: () {
                                        pushReplacement(context, ConfirmedScreen());
                                      },
                                      label: S().bookNow,
                                      bgColor: AppColors.primary,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 13.sp),
                                      padding: EdgeInsets.all(17.sp),
                                      borderRadius:
                                          BorderRadius.circular(13.sp),
                                    ),
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
