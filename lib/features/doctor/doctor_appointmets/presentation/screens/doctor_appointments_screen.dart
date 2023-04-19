import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
   DoctorAppointmentsScreen({Key? key}) : super(key: key);
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
                        children: [

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
