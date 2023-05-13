import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
bool status = false;
class DayItem extends StatefulWidget {
const  DayItem({Key? key, required this.day, required this.onTap}) : super(key: key);
  final String day;
  final VoidCallback onTap;
  @override
  State<DayItem> createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(17.sp),
      margin: EdgeInsets.symmetric(vertical: 12.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp), color: Colors.grey[200]),
      child: Row(
        children: [
          Text(widget.day),
          Spacer(),
          Visibility(visible: status, child: GestureDetector(
              onTap: widget.onTap,
              child: Icon(Icons.add))),
          FlutterSwitch(
              width: 27.sp,
              height: 20.sp,
              activeColor: AppColors.primary,
              toggleSize: 18.sp,
              value: status,
              borderRadius: 30.0,
              padding: 0,
              showOnOff: false,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              }),
        ],
      ),
    );
  }
}
