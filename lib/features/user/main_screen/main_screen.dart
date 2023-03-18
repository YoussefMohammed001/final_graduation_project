
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/features/user/main_screen/manager/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      selectedItemColor: AppColors.primary,
      onTap: (value) {
        cubit.index = value;
        setState(() {});
      },
      currentIndex: cubit.index,
      items:  [
        BottomNavigationBarItem(
          label:"Home",
            icon: AppSVG(assetName:'ic_tabs_ic_homepage',color: cubit.index ==0 ? AppColors.primary: Colors.grey,)
        ),
         BottomNavigationBarItem(
          label:"Appointments",
          icon: AppSVG(assetName: 'group', color: cubit.index ==1 ? AppColors.primary: Colors.grey,)
        ),
        BottomNavigationBarItem(
          label:"profile",
            icon: AppSVG(assetName:cubit.index== 2 ?'ic_tabs_ic_account_active':"profile_inactive",
              color: cubit.index ==2 ? AppColors.primary: Colors.grey,)
        ),


    ],


    );
  }
}