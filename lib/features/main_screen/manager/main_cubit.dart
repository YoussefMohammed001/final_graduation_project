
import 'package:final_graduation_project/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;

  List<Widget> screens = [
  ProfileScreen(),
  ProfileScreen(),
  ProfileScreen(),
  ProfileScreen(),
  ProfileScreen(),
  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToAppointmentScreen(){
    index = 4;
    emit(SwitchToAppointmentScreen());
  }





  void switchToProfileScreen(){
    index = 3;
    emit(SwitchToProfileScreen());
  }

}
