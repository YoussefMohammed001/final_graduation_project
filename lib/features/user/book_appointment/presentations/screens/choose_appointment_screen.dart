import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/book_appointment/data/models/choose_appointment_model.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/manager/choose_appointmnet_cubit.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/screens/confirm_appointmnet_screen.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/widgets/choose_appointment.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseAppointmentScreen extends StatefulWidget {
  const ChooseAppointmentScreen(
      {Key? key,
      required this.id,
      required this.doctorSpecialist,
      required this.doctorImg,
      required this.doctorName,
      required this.doctorPrice,
      required this.rating,
      required this.ratingNum})
      : super(key: key);
  final String id;
  final String doctorSpecialist;
  final String doctorImg;
  final String doctorName;
  final String doctorPrice;
  final double rating;
  final double ratingNum;

  @override
  State<ChooseAppointmentScreen> createState() =>
      _ChooseAppointmentScreenState();
}

class _ChooseAppointmentScreenState extends State<ChooseAppointmentScreen> {
  final cubit = ChooseAppointmnetCubit();
  @override
  void initState() {
    cubit.chooseAppointment(id: widget.id);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<ChooseAppointmnetCubit, ChooseAppointmnetState>(
        listener: (context, state) {
          if (state is ChooseAppointmnetSuccess) {
            hideLoading();
          }
        },
        builder: (context, state) {
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S().chooseYourAppointment,
                                            style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: 1.h,
                                              child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 10,
                                                        crossAxisSpacing: 10,
                                                        childAspectRatio: 5.sp),
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  ChooseAppointmnetData choose =
                                                      cubit.chooseAppointmentList[
                                                          index];
                                                  return AppointmentItem(
                                                    from: choose.from,
                                                    day: choose.day,
                                                    to: choose.to,
                                                    onTap: () {
                                                      push(
                                                          context,
                                                          ConfirmAppointmentScreen(
                                                            doctorSpecialist: widget
                                                                .doctorSpecialist,
                                                            doctorName: widget
                                                                .doctorName,
                                                            doctorImg: widget
                                                                .doctorImg,
                                                            day: choose.day,
                                                            from: choose.from,
                                                            to: choose.to,
                                                            price: widget
                                                                .doctorPrice,
                                                            id: choose.id,
                                                            rate: widget.rating,
                                                            rateNum: widget
                                                                .ratingNum,
                                                          ));
                                                    },
                                                  );
                                                },
                                                itemCount: cubit
                                                    .chooseAppointmentList
                                                    .length,
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
        },
      ),
    );
  }
}
