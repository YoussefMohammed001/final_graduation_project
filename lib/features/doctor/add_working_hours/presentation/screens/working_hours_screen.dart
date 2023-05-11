import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/data/post_working_hours_model.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/presentation/widgets/day_item.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/presentation/widgets/shift_item.dart';
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
  bool status = false;
  List<Durations> durations = [];
  List<Appointments> appointmnets = [];

  @override
  void initState() {
    cubit.postWorkingHoursModel.doctorId;
    durations.add(Durations(from: 8,to: 15));
    durations.add(Durations(from: 15,to: 12));
   
    appointmnets.add(Appointments(dayNo: 5, durations: durations));

  cubit.postWorkingHoursModel.appointments
        .add(Appointments(dayNo: 4, durations: durations));
cubit.postWorkingHours(id: MyShared.getString(key: MySharedKeys.id).toString(),
    appointments:appointmnets);
    // TODO: implement initState
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
                                      day: 'Suterday',
                                  ),
                                  Visibility(
                                    visible: status,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Shifttem();
                                      },
                                      itemCount: 2,
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: 7,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                AppButton(onPressed: () {


                }, label: "label")
              ],
            ),
          );
        },
      ),
    );
  }
}





