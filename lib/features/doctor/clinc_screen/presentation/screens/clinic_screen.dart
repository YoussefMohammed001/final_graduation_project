import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_graduation_project/core/cubits/notifications/new_notifications_cubit.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/doctor/add_working_hours/presentation/screens/working_hours_screen.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/presentation/manager/pending_appointments_cubit.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/presentation/widgets/clinic_data_item.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/presentation/widgets/new_reservation_doctor_teim.dart';
import 'package:final_graduation_project/features/doctor/clinic_data/screens/clinic_data_screen.dart';
import 'package:final_graduation_project/features/user/heart_rediction/presentation/screens/heart_rediction_screen.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/predict_diseases_item.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/data/pending_appointments_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({Key? key}) : super(key: key);

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  TextEditingController searchController = TextEditingController();
  final notify = NewNotificationsCubit();
  final cubit = PendingAppointmentsCubit();
  SingleValueDropDownController status = SingleValueDropDownController();
//yoseffmohamed001@gmail.com
// yoseffmohamed001@gmail.com
  @override
  void initState() {
    notify.getNotifications();
    cubit.getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => cubit,
            ),
        BlocProvider(
          create: (context) => notify,
        ),
      ],
      child: BlocBuilder<PendingAppointmentsCubit, PendingAppointmentsState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                HomeAppBar(
                  userImage:
                  MyShared.getString(key: MySharedKeys.patientImage),
                  searchController: searchController,
                  user: MyShared.getString(key: MySharedKeys.username),
                  notify: notify.notifications.length,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ClinicDataItem(
                          icon: Icons.access_time_outlined,
                          text: 'Working Hours',
                          onTap: () {
                            push(context, WorkingHoursScreen());
                          },
                        )),
                    Expanded(
                        child: ClinicDataItem(
                          icon: Icons.add_home_outlined,
                          text: 'Clinic Data',
                          onTap: () {
                            push(context, ClinicDataScreen());
                          },
                        )),
                  ],
                ),
                PredictDiseases(
                  image:
                  'assets/images/h.jpg',
                  title: S().heartDiseases,
                  onTap: () {
                    push(context,
                        HeartPredictionScreen());
                  },
                ),
                Container(
                  alignment: AlignmentDirectional.topStart,
                  margin: EdgeInsets.all(18.sp),
                  child: Row(
                    children: [
                      Text(
                        "New Reservations",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        cubit.pendingAppointments.length.toString(),
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ")",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemBuilder: (BuildContext context, int index) {
                      Data pendingAppointments = cubit
                          .pendingAppointments[index];
                      return NewReservationDoctorItem(
                        name: pendingAppointments.name,
                        phone: pendingAppointments.phone,
                        date: pendingAppointments.dayDate,
                        time: pendingAppointments.time,
                        dropDownList: const [
                          DropDownValueModel(
                              name: "accept", value: "accepted"),
                          DropDownValueModel(
                              name: "refuse", value: "accepted")
                        ],
                        status: status,

                        onChanged: (value) {
                          safePrint(value);
                          cubit.changeStatus(id: pendingAppointments.id,
                              status: status.dropDownValue!.value);
                          cubit.getAppointments();
                        },
                        note: pendingAppointments.note,
                      );
                    },
                    itemCount: cubit.pendingAppointments.length,


                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


