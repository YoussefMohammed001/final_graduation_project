import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/manager/choose_appointmnet_cubit.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/screens/confirmed_screen.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/appointment_item.dart';
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
    required this.doctorSpecialist,
    required this.doctorName,
    required this.doctorImg,
    required this.day,
    required this.from,
    required this.to,
    required this.price,
    required this.id,
    required this.rate,
    required this.rateNum,
  }) : super(key: key);
  final String doctorSpecialist;
  final String doctorName;
  final String doctorImg;
  final String day;
  final String from;
  final String to;
  final String price;
  final String id;
  final double rate;
  final double rateNum;

  @override
  State<ConfirmAppointmentScreen> createState() =>
      _ConfirmAppointmentScreenState();
}

class _ConfirmAppointmentScreenState extends State<ConfirmAppointmentScreen> {
  TextEditingController patientNameController = TextEditingController();

  TextEditingController patientMobileController = TextEditingController();

  TextEditingController patientAddressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final cubit = ChooseAppointmnetCubit();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<ChooseAppointmnetCubit, ChooseAppointmnetState>(
        listener: (context, state) {
          if (state is ChooseAppointmnetSuccess) {
            push(
                context,
                ConfirmedScreen(
                  from: widget.from,
                  to: widget.to,
                ));
          }
        },
        child: Form(
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
                                        DoctorItemConfirm(
                                          imageUrl: widget.doctorImg,
                                          doctorName: widget.doctorName,
                                          doctorSpecialist:
                                              widget.doctorSpecialist,
                                          rate: widget.rate,
                                          numberOfReviews: widget.rate
                                              .toDouble()
                                              .toInt()
                                              .toString(),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        AppointmentItemConfrim(
                                          date: widget.day,
                                          price: widget.price,
                                          timeFrom: widget.from,
                                          timeTo: widget.to,
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        PatientInformationItem(
                                          patientName: MyShared.getString(
                                              key: MySharedKeys.username),
                                          patientMobile:
                                              "0${MyShared.getInt(key: MySharedKeys.phone)}",
                                          patientNameController:
                                              patientNameController,
                                          patientMobileController:
                                              patientMobileController,
                                          noteController:

                                              patientAddressController,
                                          patientNote: '',
                                        ),
                                        Spacer(),
                                        AppButton(
                                          onPressed: () {
                                            cubit.bookAppointment(
                                                id: widget.id,
                                                name: patientNameController
                                                        .text.isEmpty
                                                    ? MyShared.getString(
                                                        key: MySharedKeys
                                                            .username)
                                                    : patientNameController
                                                        .text,
                                                phone: patientMobileController
                                                        .text.isEmpty
                                                    ? MyShared.getInt(
                                                        key: MySharedKeys.phone).toString()
                                                    : patientMobileController
                                                        .text,
                                                note: patientAddressController
                                                    .text);
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
        ),
      ),
    );
  }
}
