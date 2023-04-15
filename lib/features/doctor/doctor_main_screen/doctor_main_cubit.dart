import 'package:final_graduation_project/features/doctor/clinc_screen/presentation/screens/clinic_screen.dart';
import 'package:final_graduation_project/features/user/appoinntment/presentation/pages/appointment_screem.dart';
import 'package:final_graduation_project/features/user/home/presentation/pages/home_screen.dart';
import 'package:final_graduation_project/features/user/profile/presentation/manager/profile_cubit.dart';
import 'package:final_graduation_project/features/user/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Doctormain_state.dart';

class DoctorMainCubit extends Cubit<DoctorMainState> {
  DoctorMainCubit() : super(DoctorMainInitial());

  int index = 0;

  List<Widget> screens = [
    const ClinicScreen(),
    const AppointmentScreen(),
    BlocProvider(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    ),

  ];






}
