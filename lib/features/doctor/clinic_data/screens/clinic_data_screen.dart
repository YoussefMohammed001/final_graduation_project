import 'dart:io';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
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

  late File _image2;

  late File _image3;

  late File _image4;

  late File _image5;

  final pickedFile1 = ImagePicker();

  final pickedFile2 = ImagePicker();

  final pickedFile3 = ImagePicker();

  final pickedFile4 = ImagePicker();

  final pickedFile5 = ImagePicker();

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

  uploadImage1() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile1.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image1 = File(pickedImage.path);

        cubit.addClinicImages(
            image: _image1.path,
            id: MyShared.getString(key: MySharedKeys.id),
            image2: _image2.path,
            image3: _image3.path,
            image4: _image4.path,
            image5: _image5.path);
      });
    }
  }

  uploadImage2() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile2.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image2 = File(pickedImage.path);
      });
    }
  }

  uploadImage3() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile3.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image3 = File(pickedImage.path);
      });
    }
  }

  uploadImage4() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile4.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image4 = File(pickedImage.path);
      });
    }
  }

  uploadImage5() async {
    // ignore: deprecated_member_use
    var pickedImage = await pickedFile5.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image5 = File(pickedImage.path);
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
                                                onTap: uploadImage1,
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
                                              Container(
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
                                                  ))
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
                                              Container(
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
                                                  ))
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
                                              Container(
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
                                                  ))
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
                                              Container(
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
                                                  ))
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
                                            cubit.updateDoctorNameAr(
                                                name: nameAr.text);
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
                                        cubit.updateDoctorNameAbout(
                                            about: about.text);
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
                                            cubit.updateDoctorNameAboutAr(
                                                aboutAr: aboutAr.text);
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
                                        cubit.updateDoctorExperience(
                                            experience: experince.text);
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
                                        cubit.updateDoctorWaitingTime(
                                            waitingTime: waitingTime.text);
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
                                        cubit.updateDoctorFees(fees: fees.text);
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
                                      onTap: () {},
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
                                        cubit.updateDoctorCity(city: city.text);
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
                                            cubit.updateDoctorCityAR(
                                                cityAR: cityAr.text);
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
                                        cubit.updateDoctorPlaceNO(
                                            placeNO: place.text);
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
                                            cubit.updateDoctorPlaceNOAr(
                                                placeNOAr: placeAr.text);
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
