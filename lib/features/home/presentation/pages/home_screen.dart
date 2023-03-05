import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/home/presentation/widgets/home_app_bar.dart';
import 'package:final_graduation_project/features/home/presentation/widgets/latest_doctor_tem.dart';
import 'package:final_graduation_project/features/home/presentation/widgets/prediction_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          HomeAppBar(
            userImage:
                'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
            searchController: searchController,
            user: 'ahmed',
          ),
          const PredictionItem(
            prediction: 'Skin Cancer',
          ),
          const PredictionItem(
            prediction: 'Heart Disease',
          ),
          const PredictionItem(
            prediction: 'Diabetes',
          ),
          // const PredictionItem(prediction: 'Diabetes',),
          Container(
            margin: EdgeInsets.symmetric(vertical: 13.sp, horizontal: 17.sp),
            child: Row(
              children: [
                Text(
                  "Latest Doctors",
                  style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Text(
                  "View All",
                  style: TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 30.h,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                LatestDoctorItem(),
                LatestDoctorItem(),
                LatestDoctorItem(),
                LatestDoctorItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
