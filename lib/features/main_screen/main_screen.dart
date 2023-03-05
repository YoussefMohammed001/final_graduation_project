
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/features/main_screen/manager/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  MainCubit cubit = MainCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          safePrint("Main");
          return Scaffold(
            //floating action button position to center
            bottomNavigationBar: bottomNavBar(),
            body: cubit.screens[cubit.index],
          );
        },
      ),
    );
  }

  Widget bottomNavBar() {

    return BottomNavigationBar(
      selectedItemColor: AppColors.text,
      onTap: (value) {
        cubit.index = value;
        setState(() {});
      },
      currentIndex: cubit.index,
      items:  [
        BottomNavigationBarItem(
          label:"Home",
            icon: AppSVG(assetName:cubit.index== 0 ?'ic_tabs_ic_homepage':"ic_tabs_ic_homepage_inactive",)
        ),
        BottomNavigationBarItem(
          label:"Appointment",
          icon: AppSVG(assetName: 'group',)
        ),
        BottomNavigationBarItem(
          label:"profile",
            icon: AppSVG(assetName:cubit.index== 2 ?'ic_tabs_ic_account_active':"profile_inactive",)
        ),


    ],


    );
  }
}