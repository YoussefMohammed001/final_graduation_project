import 'package:final_graduation_project/features/appoinntment/presentation/pages/appointment_screem.dart';
import 'package:final_graduation_project/features/home/presentation/pages/home_screen.dart';
import 'package:final_graduation_project/features/profile/presentation/manager/profile_cubit.dart';
import 'package:final_graduation_project/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;

  List<Widget> screens = [
    HomeScreen(),
    AppointmentScreen(),
    BlocProvider(
      create: (context) => ProfileCubit(),
      child: const ProfileScreen(),
    ),

  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToAppointmentScreen() {
    index = 4;
    emit(SwitchToAppointmentScreen());
  }


  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }

}
