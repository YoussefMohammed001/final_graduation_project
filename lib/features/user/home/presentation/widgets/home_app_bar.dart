import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/search_text_field.dart';
import 'package:final_graduation_project/features/user/nearest_doctors_screen/presentation/screens/nearest_doctor_screen.dart';
import 'package:final_graduation_project/features/user/notifications/presentation/screens/notifications_screen.dart';
import 'package:final_graduation_project/features/user/notifications/presentation/widgets/notification_widgets.dart';
import 'package:final_graduation_project/features/user/profile_details/presentation/pages/profile_details_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeAppBar extends StatefulWidget {
   HomeAppBar(
      {Key? key,
      required this.userImage,
      required this.searchController,
      required this.user})
      : super(key: key);
  final TextEditingController searchController;
  final String userImage;
  final String user;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late double lat;
  late double long;

  String location = 'current location';

  Future<Position> _getCurrentLocation()async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("Location services is disabled");
    }
    LocationPermission  permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
      return Future.error("Location services is disabled");
      }
    }
    if(permission == LocationPermission.deniedForever){
      return Future.error("Location services is disabled");
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(

          color: AppColors.primary,
          width: double.infinity,
          child: Padding(

            padding: EdgeInsets.symmetric(

                vertical: 13.sp, horizontal: 15.sp),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                InkWell(

                  onTap: ()=> push(context, const profileDetailsScreen()),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.userImage),
                        radius: 20.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${S().hello} ${widget.user}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                           Text(
                            S().hopeYouAreOk,
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: (){
                          push(context, const NotificationsScreen());
                        },
                        child: Stack(
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
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: MyShared.getBoolean(key: MySharedKeys.isDoctor) == false,
          child: Container(
            margin: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 40.sp),
            child: InkWell(
              onTap: (){

                _getCurrentLocation().then((value) {
                  push(context,  NearestDoctorScreen(lat: value.latitude.toString(), lang: value.longitude.toString(),));

                  lat = value.latitude;

                  long = value.longitude;
                });
              },

              child: SearchTextFiled(

                margin: EdgeInsets.all(15.sp),
                padding: EdgeInsets.all(25.sp),
                hint: S().searchForNearestDoctor,

              ),
            ),
          ),
        )
      ],
    );
  }
}
