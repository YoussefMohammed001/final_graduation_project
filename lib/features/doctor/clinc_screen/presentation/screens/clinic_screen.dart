import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/features/doctor/clinc_screen/presentation/widgets/clinic_data_item.dart';
import 'package:final_graduation_project/features/doctor/clinic_data/screens/clinic_data_screen.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClinicScreen extends StatelessWidget {
  ClinicScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAppBar(
            userImage: MyShared.getString(key: MySharedKeys.patientImage),
            searchController: searchController,
            user: MyShared.getString(key: MySharedKeys.username),
          ),
          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constrains.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: ClinicDataItem(
                                    icon: Icons.access_time_outlined,
                                    text: 'Working Hours',
                                    onTap: () {},
                                  )),
                                  Expanded(
                                      child: ClinicDataItem(
                                    icon: Icons.add_home_outlined,
                                    text: 'Clinic Data',
                                    onTap: () {
                                      push(context,ClinicDataScreen());
                                    },
                                  )),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.all(13.sp),
                                child: Text(
                                  "predict for disease",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
