import 'package:final_graduation_project/features/doctor/clinc_screen/presentation/screens/clinic_screen.dart';
import 'package:final_graduation_project/features/doctor/doctor_appointmets/presentation/screens/doctor_appointments_screen.dart';
import 'package:final_graduation_project/features/user/profile/presentation/manager/profile_cubit.dart';
import 'package:final_graduation_project/features/user/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Doctormain_state.dart';

class DoctorMainCubit extends Cubit<DoctorMainState> {
  DoctorMainCubit() : super(DoctorMainInitial());

  int index = 0;

  List<Widget> screens = [
     ClinicScreen(),
     DoctorAppointmentsScreen(),
    BlocProvider(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    ),

  ];






}
