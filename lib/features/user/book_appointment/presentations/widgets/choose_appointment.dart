import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({
    Key? key,
    required this.from,
    required this.day,
    required this.to, required this.onTap,
  }) : super(key: key);

  final String from;
  final String to;
  final String day;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(

        margin: EdgeInsets.all(9.sp),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          borderRadius: BorderRadius.circular(15.sp),
          color: Colors.white,
        ),
        child: InkWell(

          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(from,style: const TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    width: 1.w,
                  ),
                  const Text("to",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(to,style: const TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                day,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.sp),
                        bottomLeft: Radius.circular(15.sp),
                      ),
                      color: AppColors.primary),
                  child:  Center(
                    child: Text(
                      S().bookNow,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
