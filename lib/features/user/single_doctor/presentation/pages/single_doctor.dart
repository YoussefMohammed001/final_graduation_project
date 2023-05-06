import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:final_graduation_project/features/user/book_appointment/presentations/screens/choose_appointment_screen.dart';
import 'package:final_graduation_project/features/user/single_doctor/data/single_doctor_model.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/manager/doctor_cubit.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/widgets/dr_description.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/widgets/dr_location.dart';
import 'package:final_graduation_project/features/user/single_doctor/presentation/widgets/dr_profile.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SingleDoctor extends StatefulWidget {
  SingleDoctor({Key? key, required this.id, required this.img}) : super(key: key);
  final String id;
  final String img;

  @override
  State<SingleDoctor> createState() => _SingleDoctorState();
}

class _SingleDoctorState extends State<SingleDoctor> {
  final cubit = DoctorCubit();
  bool visible = false;
  PageController indicatorController = PageController();

  @override
  void initState() {
    cubit.getSingleDoctorData(id: widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<DoctorCubit, DoctorState>(
        listener: (context, state) {
          if (state is DoctorSuccess) {
            visible = !visible;
            print(visible);
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: LayoutBuilder(
                  builder: (context, constrains) => SingleChildScrollView(
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constrains.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Visibility(
                              visible: visible,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Stack(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        children: [
                                          CarouselSlider.builder(
                                            itemCount: cubit.img.length,
                                            itemBuilder: (BuildContext context,
                                                int itemIndex,
                                                int pageViewIndex) {
                                              Img img = cubit.img[itemIndex];
                                              return AppImage(
                                                width: double.infinity,
                                                height: 20.h,
                                                imageUrl: img.url,
                                              );
                                            },
                                            options: CarouselOptions(
                                              viewportFraction: 1,
                                              autoPlayInterval:
                                                  const Duration(seconds: 2),
                                              autoPlay: false,
                                              enlargeCenterPage: true,
                                            ),
                                          ),

                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 25.sp,
                                                left: 10.sp,
                                                right: 10.sp),
                                            child: InkWell(
                                                onTap: () {
                                                  pop(context);
                                                },
                                                child: AppSVG(
                                                  assetName:
                                                      "ic_ic_dropdown_back_copy_3",
                                                  height: 5.h,
                                                  width: 2.w,
                                                )),
                                          ),
                                        ],
                                      ),
                                      DrProfile(
                                        name: cubit.singleDoctorData.name,
                                        numOfReviews: cubit
                                            .singleDoctorData.ratingsQuantity
                                            .toInt(),
                                        rating: cubit.singleDoctorData.rating
                                            .toDouble(),
                                        specialization:
                                            cubit.singleDoctorData.specialize,
                                        fees: cubit
                                            .singleDoctorData.consultation
                                            .toString(), img: widget.img,
                                      ),
                                      Divider(
                                        height: 10.sp,
                                        thickness: 12.sp,
                                        color: Colors.grey.shade200,
                                      ),
                                      DrDescription(
                                        about: cubit.singleDoctorData.about,
                                      ),
                                      Divider(
                                        height: 10.sp,
                                        thickness: 12.sp,
                                        color: Colors.grey.shade200,
                                      ),
                                       DrLocation(location: "${cubit.singleDoctorData.city} - ${cubit.singleDoctorData.placeNumber}" ,),
                                      Divider(
                                        height: 10.sp,
                                        thickness: 12.sp,
                                        color: Colors.grey.shade200,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12.sp),
                                        child: AppButton(
                                          bgColor: AppColors.primary,
                                          onPressed: () {
                                            push(context,
                                                 ChooseAppointmentScreen(id: cubit.singleDoctorData.id, doctorSpecialist: cubit.singleDoctorData.specialize, doctorImg: widget.img, doctorName: cubit.singleDoctorData.name, doctorPrice: cubit.singleDoctorData.consultation.toString(), rating: cubit.singleDoctorData.rating.toDouble(), ratingNum: cubit.singleDoctorData.ratingsQuantity.toDouble(),));
                                            safePrint(cubit.singleDoctorData.id);
                                          },
                                          label: S().bookNow,
                                        ),
                                      ),
                                    ],

                                  ),
                                ],
                              ),
                            ),
                          )))));
        },
      ),
    );
  }
}
