import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClinicDataScreen extends StatelessWidget {
  const ClinicDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Clinic Data',),
          ///
          Expanded(
            child: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Container(
                        margin: EdgeInsets.all(13.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AppImage(
                                      imageUrl:
                                      "https://images.unsplash.com/photo-1551076805-e1869033e561?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",

                                      width: double.infinity,
                                      height: 45.sp,
                                    bottomLeftRadius: 15.sp,
                                    bottomRightRadius: 15.sp,
                                    topRightRadius: 15.sp,
                                    topLeftRadius: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Expanded(
                                  child: AppImage(
                                      imageUrl:
                                      "https://images.unsplash.com/photo-1551076805-e1869033e561?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",

                                      width: double.infinity,
                                      height: 45.sp,
                                    bottomLeftRadius: 15.sp,
                                    bottomRightRadius: 15.sp,
                                    topRightRadius: 15.sp,
                                    topLeftRadius: 15.sp,
                                  ),
                                ),
                                ],
                            ),
                            SizedBox(height: 2.h,),
                            Row(
                              children: [
                                Expanded(
                                  child: AppImage(
                                      imageUrl:
                                      "https://images.unsplash.com/photo-1551076805-e1869033e561?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",

                                      width: double.infinity,
                                      height: 45.sp,
                                    bottomLeftRadius: 15.sp,
                                    bottomRightRadius: 15.sp,
                                    topRightRadius: 15.sp,
                                    topLeftRadius: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Expanded(
                                  child: AppImage(
                                      imageUrl:
                                      "https://images.unsplash.com/photo-1551076805-e1869033e561?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",

                                      width: double.infinity,
                                      height: 45.sp,
                                    bottomLeftRadius: 15.sp,
                                    bottomRightRadius: 15.sp,
                                    topRightRadius: 15.sp,
                                    topLeftRadius: 15.sp,
                                  ),
                                ),
                                SizedBox(width: 2.w,),
                                Expanded(
                                  child: AppImage(
                                      imageUrl:
                                      "https://images.unsplash.com/photo-1551076805-e1869033e561?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y2xpbmljfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60",

                                      width: double.infinity,
                                      height: 45.sp,
                                    bottomLeftRadius: 15.sp,
                                    bottomRightRadius: 15.sp,
                                    topRightRadius: 15.sp,
                                    topLeftRadius: 15.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
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
