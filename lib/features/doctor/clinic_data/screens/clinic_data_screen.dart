import 'dart:io';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/pick_image_dialogue.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/widgets/app_image.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/manager/doctor_data_images_cubit.dart';
import 'package:final_graduation_project/features/doctor/clinic_data/presentation/widgets/clinc_data_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClinicDataScreen extends StatefulWidget {
  const ClinicDataScreen({Key? key}) : super(key: key);

  @override
  State<ClinicDataScreen> createState() => _ClinicDataScreenState();
}

class _ClinicDataScreenState extends State<ClinicDataScreen> {
  TextEditingController about = TextEditingController();

  TextEditingController nameAr = TextEditingController();

  TextEditingController aboutAr = TextEditingController();

  TextEditingController city = TextEditingController();

  TextEditingController cityAr = TextEditingController();

  TextEditingController place = TextEditingController();

  TextEditingController placeAr = TextEditingController();

  TextEditingController experince = TextEditingController();

  TextEditingController waitingTime = TextEditingController();

  TextEditingController fees = TextEditingController();

  final cubit = DoctorDataImagesCubit();

  late File _image1;

  final pickedFile1 = ImagePicker();

  @override
  void initState() {
    nameAr.text = MyShared.getString(key: MySharedKeys.drNameAr);
    about.text = MyShared.getString(key: MySharedKeys.drabout);
    aboutAr.text = MyShared.getString(key: MySharedKeys.draboutAr);
    experince.text = MyShared.getString(key: MySharedKeys.drExperince);
    waitingTime.text = MyShared.getString(key: MySharedKeys.drWaitingTime);
    city.text = MyShared.getString(key: MySharedKeys.drAddress);
    cityAr.text = MyShared.getString(key: MySharedKeys.drAddressAR);
    place.text = MyShared.getString(key: MySharedKeys.drPlace);
    placeAr.text = MyShared.getString(key: MySharedKeys.drPlaceAr);

    super.initState();
  }

  uploadImage1(
      {required MySharedKeys idKey,
      required MySharedKeys imgKey,
      required ImageSource source}) async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile1.getImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _image1 = File(pickedImage.path);
        cubit.updateClincImages(
            imgId: MyShared.getString(key: idKey),
            img: _image1.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<DoctorDataImagesCubit, DoctorDataImagesState>(
        listener: (context, state) {
          if (state is DoctorImagesSuccess) {
            hideLoading();
          }
          if (state is DoctorImagesFailure) {
            hideLoading();

            showError(state.message);
          }
          if (state is DoctorDataSuccess) {
            hideLoading();

            setState(() {
              edit = !edit;
            });
          }
          if (state is DoctorDataFailure) {
            hideLoading();

            showError(state.message);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          body: Column(
            children: [
              const CustomAppBar(
                title: 'Clinic Data',
              ),
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
                                    Text(
                                      "Clinic Images",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              AppImage(
                                                imageUrl: MyShared.getString(
                                                    key: MySharedKeys
                                                        .clinicImage1),
                                                width: double.infinity,
                                                height: 45.sp,
                                                bottomLeftRadius: 15.sp,
                                                bottomRightRadius: 15.sp,
                                                topRightRadius: 15.sp,
                                                topLeftRadius: 15.sp,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  dialogBuilder(
                                                    context,
                                                    () {
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId1,
                                                          imgKey: MySharedKeys
                                                              .clinicImage1,
                                                          source: ImageSource
                                                              .camera);
                                                      pop(context);
                                                      safePrint("camera");
                                                    },
                                                    () {
                                                      pop(context);
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId1,
                                                          imgKey: MySharedKeys
                                                              .clinicImage1,
                                                          source: ImageSource
                                                              .gallery);

                                                      safePrint("gallery");
                                                    },
                                                  );
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.all(8.sp),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        15.sp),
                                                                bottomLeft: Radius
                                                                    .circular(15
                                                                        .sp))),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Expanded(
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              AppImage(
                                                imageUrl: MyShared.getString(
                                                    key: MySharedKeys
                                                        .clinicImage2),
                                                width: double.infinity,
                                                height: 45.sp,
                                                bottomLeftRadius: 15.sp,
                                                bottomRightRadius: 15.sp,
                                                topRightRadius: 15.sp,
                                                topLeftRadius: 15.sp,
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  dialogBuilder(
                                                    context,
                                                        () {
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId2,
                                                          imgKey: MySharedKeys
                                                              .clinicImage2,
                                                          source: ImageSource
                                                              .camera);
                                                      pop(context);
                                                      safePrint("camera");
                                                    },
                                                        () {
                                                      pop(context);
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId2,
                                                          imgKey: MySharedKeys
                                                              .clinicImage2,
                                                          source: ImageSource
                                                              .gallery);

                                                      safePrint("gallery");
                                                    },
                                                  );
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(8.sp),
                                                    decoration: BoxDecoration(
                                                        color: AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        15.sp),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.sp))),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              AppImage(
                                                imageUrl: MyShared.getString(
                                                    key: MySharedKeys
                                                        .clinicImage3),
                                                width: double.infinity,
                                                height: 45.sp,
                                                bottomLeftRadius: 15.sp,
                                                bottomRightRadius: 15.sp,
                                                topRightRadius: 15.sp,
                                                topLeftRadius: 15.sp,
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  dialogBuilder(
                                                    context,
                                                        () {
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId3,
                                                          imgKey: MySharedKeys
                                                              .clinicImage3,
                                                          source: ImageSource
                                                              .camera);
                                                      pop(context);
                                                      safePrint("camera");
                                                    },
                                                        () {
                                                      pop(context);
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId3,
                                                          imgKey: MySharedKeys
                                                              .clinicImage3,
                                                          source: ImageSource
                                                              .gallery);

                                                      safePrint("gallery");
                                                    },
                                                  );
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(8.sp),
                                                    decoration: BoxDecoration(
                                                        color: AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        15.sp),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.sp))),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Expanded(
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              AppImage(
                                                imageUrl: MyShared.getString(
                                                    key: MySharedKeys
                                                        .clinicImage4),
                                                width: double.infinity,
                                                height: 45.sp,
                                                bottomLeftRadius: 15.sp,
                                                bottomRightRadius: 15.sp,
                                                topRightRadius: 15.sp,
                                                topLeftRadius: 15.sp,
                                              ),
                                              InkWell(
                                                onTap:(){
                                                  dialogBuilder(
                                                    context,
                                                        () {
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId4,
                                                          imgKey: MySharedKeys
                                                              .clinicImage4,
                                                          source: ImageSource
                                                              .camera);
                                                      pop(context);
                                                      safePrint("camera");
                                                    },
                                                        () {
                                                      pop(context);
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId4,
                                                          imgKey: MySharedKeys
                                                              .clinicImage4,
                                                          source: ImageSource
                                                              .gallery);

                                                      safePrint("gallery");
                                                    },
                                                  );
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(8.sp),
                                                    decoration: BoxDecoration(
                                                        color: AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        15.sp),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.sp))),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Expanded(
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional.topEnd,
                                            children: [
                                              AppImage(
                                                imageUrl: MyShared.getString(
                                                    key: MySharedKeys
                                                        .clinicImage5),
                                                width: double.infinity,
                                                height: 45.sp,
                                                bottomLeftRadius: 15.sp,
                                                bottomRightRadius: 15.sp,
                                                topRightRadius: 15.sp,
                                                topLeftRadius: 15.sp,
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  dialogBuilder(
                                                    context,
                                                        () {
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId5,
                                                          imgKey: MySharedKeys
                                                              .clinicImage5,
                                                          source: ImageSource
                                                              .camera);
                                                      pop(context);
                                                      safePrint("camera");
                                                    },
                                                        () {
                                                      pop(context);
                                                      uploadImage1(
                                                          idKey: MySharedKeys
                                                              .clinicImageId5,
                                                          imgKey: MySharedKeys
                                                              .clinicImage5,
                                                          source: ImageSource
                                                              .gallery);

                                                      safePrint("gallery");
                                                    },
                                                  );
                                                  setState(() {

                                                  });
                                                },
                                                child: Container(
                                                    padding: EdgeInsets.all(8.sp),
                                                    decoration: BoxDecoration(
                                                        color: AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        15.sp),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15.sp))),
                                                    child: const Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      "Clinic Data",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ClinicTextFormField(
                                          validators: (value) {
                                            if (value == null) {
                                              return "this field is required";
                                            }
                                            return null;
                                          },
                                          hint: MyShared.getString(
                                              key: MySharedKeys.drNameAr),
                                          controller: nameAr,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,
                                          onTap: () {
                                            cubit.addDoctorDataa(
                                                name: nameAr.text,
                                                id: MyShared.getString(
                                                    key: MySharedKeys.id));
                                          },
                                        )),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ClinicTextFormField(
                                      validators: (value) {
                                        if (value == null) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      hint: MyShared.getString(
                                          key: MySharedKeys.drabout),
                                      controller: about,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onTap: () {
                                        cubit.addDoctorDataa(
                                            name: about.text,
                                            id: MyShared.getString(
                                                key: MySharedKeys.id));
                                      },
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ClinicTextFormField(
                                          validators: (value) {
                                            if (value == null) {
                                              return "this field is required";
                                            }
                                            return null;
                                          },
                                          hint: MyShared.getString(
                                              key: MySharedKeys.draboutAr),
                                          controller: aboutAr,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,
                                          onTap: () {
                                            cubit.addDoctorDataa(
                                                name: aboutAr.text,
                                                id: MyShared.getString(
                                                    key: MySharedKeys.id));
                                          },
                                        )),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ClinicTextFormField(
                                      validators: (value) {
                                        if (value == null) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      hint: MyShared.getString(
                                          key: MySharedKeys.drExperince),
                                      controller: experince,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onTap: () {
                                        cubit.addDoctorDataa(
                                            name: experince.text,
                                            id: MyShared.getString(
                                                key: MySharedKeys.id));
                                      },
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ClinicTextFormField(
                                      validators: (value) {
                                        if (value == null) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      hint: MyShared.getString(
                                          key: MySharedKeys.drWaitingTime),
                                      controller: waitingTime,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onTap: () {
                                        cubit.addDoctorDataa(
                                            name: waitingTime.text,
                                            id: MyShared.getString(
                                                key: MySharedKeys.id));
                                      },
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ClinicTextFormField(
                                      validators: (value) {
                                        if (value == null) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      hint: MyShared.getString(
                                          key: MySharedKeys.drFees),
                                      controller: fees,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onTap: () {
                                        cubit.addDoctorDataa(
                                            name: fees.text,
                                            id: MyShared.getString(
                                                key: MySharedKeys.id));
                                      },
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Clinic Location",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.sp),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ClinicTextFormField(
                                      validators: (value) {
                                        if (value == null) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      hint: MyShared.getString(
                                          key: MySharedKeys.drAddress),
                                      controller: city,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onTap: () {
                                        cubit.addDoctorDataa(
                                            name: city.text,
                                            id: MyShared.getString(
                                                key: MySharedKeys.id));
                                      },
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ClinicTextFormField(
                                      validators: (value) {
                                        if (value == null) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      hint: MyShared.getString(
                                          key: MySharedKeys.drAddress),
                                      controller: city,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onTap: () {
                                        cubit.addDoctorDataa(
                                            name: city.text,
                                            id: MyShared.getString(
                                                key: MySharedKeys.id));
                                      },
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ClinicTextFormField(
                                          validators: (value) {
                                            if (value == null) {
                                              return "this field is required";
                                            }
                                            return null;
                                          },
                                          hint: MyShared.getString(
                                              key: MySharedKeys.drAddressAR),
                                          controller: cityAr,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,
                                          onTap: () {
                                            cubit.addDoctorDataa(
                                                name: cityAr.text,
                                                id: MyShared.getString(
                                                    key: MySharedKeys.id));
                                          },
                                        )),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    ClinicTextFormField(
                                      validators: (value) {
                                        if (value == null) {
                                          return "this field is required";
                                        }
                                        return null;
                                      },
                                      hint: MyShared.getString(
                                          key: MySharedKeys.drPlace),
                                      controller: place,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      onTap: () {
                                        cubit.addDoctorDataa(
                                            name: place.text,
                                            id: MyShared.getString(
                                                key: MySharedKeys.id));
                                      },
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: ClinicTextFormField(
                                          validators: (value) {
                                            if (value == null) {
                                              return "this field is required";
                                            }
                                            return null;
                                          },
                                          hint: MyShared.getString(
                                              key: MySharedKeys.drPlaceAr),
                                          controller: placeAr,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,
                                          onTap: () {
                                            cubit.addDoctorDataa(
                                                name: placeAr.text,
                                                id: MyShared.getString(
                                                    key: MySharedKeys.id));
                                          },
                                        )),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
