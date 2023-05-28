import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/data/days_model.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/data/post_working_hours_model.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/presentation/widgets/day_item.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/presentation/widgets/shift_item.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/presentation/widgets/working_hours_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../manager/add_working_hours_cubit.dart';

class WorkingHoursScreen extends StatefulWidget {
  const WorkingHoursScreen({Key? key}) : super(key: key);

  @override
  State<WorkingHoursScreen> createState() => _WorkingHoursScreenState();
}

class _WorkingHoursScreenState extends State<WorkingHoursScreen> {
  final cubit = AddWorkingHoursCubit();
  TextEditingController hoursStart = TextEditingController();
  TextEditingController hoursEnd = TextEditingController();
  TextEditingController minStart = TextEditingController();
  TextEditingController minEnd = TextEditingController();
  List<Durations> durations = [];
  List<Appointments> appointments = [];
  List<DaysModel> days = [
    DaysModel(day: 'Saturday', iD: 0),
    DaysModel(day: 'Sunday', iD: 1),
    DaysModel(day: 'Monday', iD: 2),
    DaysModel(day: 'Tuesday', iD: 3),
    DaysModel(day: 'Wednesday', iD: 4),
    DaysModel(day: 'Thursday', iD: 5),
    DaysModel(day: 'Friday', iD: 6),
  ];

  @override
  void initState() {
    minStart.text = "00";
    hoursStart.text = "00";
    hoursEnd.text = "00";
    minEnd.text = "00";
    cubit.postWorkingHoursModel.doctorId;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<AddWorkingHoursCubit, AddWorkingHoursState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            body: Column(
              children: [
                const CustomAppBar(
                  title: 'Working Hours',
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(17.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  DayItem(
                                    day: days[index].day,
                                    onTap: () {
                                      durations.add(Durations(
                                        from: 8,
                                        to: 15,
                                      ));

                                      appointments.add(
                                        Appointments(
                                          dayNo: days[index].iD,
                                          durations: durations,
                                        ),
                                      );
                                      setState(() {});

                                      timeItem(
                                        context,
                                        done: () {

                                        },
                                        cancel: () {

                                        },
                                        hours: hoursStart,
                                        minutes: minStart,
                                        title: 'Start time',
                                      );
                                    },
                                  ),
                                  Visibility(
                                    visible: status,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Shifttem(
                                            start: durations[index]
                                                .from
                                                .toString(),
                                            end: durations[index]
                                                .to
                                                .toString(),
                                          );
                                        },
                                        itemCount: durations.length),
                                  ),
                                ],
                              );
                            },
                            itemCount: days.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                AppButton(
                    onPressed: () {

                      cubit.postWorkingHours(
                        id: MyShared.getString(key: MySharedKeys.id).toString(),
                        appointments: appointments,
                      );
                    },
                    label: "label")
              ],
            ),
          );
        },
      ),
    );
  }
}
