import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar(
      {Key? key,
      required this.userImage,
      required this.searchController,
      required this.user})
      : super(key: key);
  final TextEditingController searchController;
  final String userImage;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          color: AppColors.primary,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25.sp, horizontal: 15.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(userImage),
                      radius: 20.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello ${MyShared.getString(key: MySharedKeys.username)},",
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          "Hope you are ok!",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        AppSVG(
                          assetName: "notifications",
                          height: 21.sp,
                          width: 21.sp,
                        ),
                        CircleAvatar(
                          radius: 11.sp,
                          backgroundColor: Colors.yellow.shade800,
                          child: Text(
                            "3",
                            style:
                                TextStyle(fontSize: 13.sp, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 45.sp),
          child: MyTextFormField(
            margin: EdgeInsets.all(15.sp),
            padding: EdgeInsets.all(25.sp),
            hint: "Search",
            controller: searchController,
            isPassword: false,
            textInputAction: TextInputAction.search,
            textInputType: TextInputType.text,
          ),
        )
      ],
    );
  }
}
