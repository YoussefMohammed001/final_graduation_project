import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SwitchAppointment extends StatefulWidget {
  SwitchAppointment({Key? key}) : super(key: key);

  @override
  State<SwitchAppointment> createState() => _SwitchAppointmentState();
}

class _SwitchAppointmentState extends State<SwitchAppointment> {
  bool current = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.symmetric(horizontal: 35.sp, vertical: 20.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){
              current = true;
              setState(() {

              });
              },
              child: Container(
                padding: EdgeInsets.all(17.sp),

                child: Text(
            S().ccurrent,
            style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: current == true ? AppColors.primary : Colors.grey),
          ),
              )),
          InkWell(
            onTap: (){
              current = false;
              setState(() {

              });
            },
              child: Container(
                padding: EdgeInsets.all(17.sp),
                child: Text(
            S().previous,
            style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: current == false ? AppColors.primary : Colors.grey),
          ),
              )),
        ],
      ),
    );
  }
}
