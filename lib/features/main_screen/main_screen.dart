
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
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
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.white,
                //Floating action button on Scaffold
                onPressed: () {
                  cubit.index = 0;
                  setState(() {});
                  //code to execute on button press
                },
                child: const Icon(
                  Icons.home,
                  color: AppColors.primary,
                ), //icon inside button
              ),

              floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
              //floating action button position to center

              bottomNavigationBar: bottomNavBar(),
              body: cubit.screens[cubit.index],
            ),
          );
        },
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomAppBar(
      //bottom navigation bar on scaffold
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      //shape of notch
      notchMargin: 10.sp,
      //notch margin between floating button and bottom appbar

      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              topRight: Radius.circular(20.sp),
            )),
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: cubit.index == 4 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                cubit.index = 4;
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: cubit.index == 1 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                cubit.index = 1;
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_border_rounded,
                color: cubit.index == 2 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                cubit.index = 2;
                setState(() {});
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person_outline_outlined,
                color: cubit.index == 3 ? AppColors.primary : Colors.grey,
              ),
              onPressed: () {
                cubit.index = 3;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}