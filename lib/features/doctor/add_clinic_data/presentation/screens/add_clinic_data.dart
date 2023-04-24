import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/manager/doctor_data_images_cubit.dart';
import 'package:final_graduation_project/features/doctor/add_clinic_data/presentation/screens/add_clinc_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddClinicData extends StatefulWidget {
  const AddClinicData({Key? key}) : super(key: key);

  @override
  State<AddClinicData> createState() => _AddClinicDataState();
}

class _AddClinicDataState extends State<AddClinicData> {
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    MyShared.putString(
        key: MySharedKeys.apiToken,
        value:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NDQ0OWY3MWQ2NDdjNzljNTdkOGQxYjkiLCJpYXQiOjE2ODIyMTg4NjV9.2_aOTrrbSwsEF-ni_DSFFqHzkbIhbVDDFah8uskefAk");
    super.initState();
  }

  final cubit = DoctorDataImagesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<DoctorDataImagesCubit, DoctorDataImagesState>(
        listener: (context, state) {
          if(state is DoctorDataSuccess){
            hideLoading();
            push(context, const AddClinicImages());
          }
          if(state is DoctorDataFailure){
            hideLoading();
            showError(state.message);
          }
        },
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: LayoutBuilder(
                builder: (context, constrains) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constrains.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 25.sp, horizontal: 15.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Doctor Details",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.sp),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: MyTextFormField(
                                  validators: (value){
                                    if(value == null){
                                      return "this field is required";
                                    }
                                  },
                                    hint: "اسم الطبيب",
                                    controller: nameAr,
                                    isPassword: false,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text)),
                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextFormField(
                                validators: (value){
                                  if(value == null){
                                    return "this field is required";
                                  }
                                },
                                hint: "About doctor",
                                controller: about,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text),
                            SizedBox(
                              height: 2.h,
                            ),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: MyTextFormField(
                                    validators: (value){
                                      if(value == null){
                                        return "this field is required";
                                      }
                                    },
                                    hint: "تفاصيل عن الطبيب",
                                    controller: aboutAr,
                                    isPassword: false,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text)),
                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextFormField(
                                validators: (value){
                                  if(value == null){
                                    return "this field is required";
                                  }
                                },
                                hint: "Experience",
                                controller: experince,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text),

                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextFormField(
                                validators: (value){
                                  if(value == null){
                                    return "this field is required";
                                  }
                                },
                                hint: "Waiting time",
                                controller: waitingTime,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text),

                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextFormField(
                                validators: (value){
                                  if(value == null){
                                    return "this field is required";
                                  }
                                },
                                hint: "Fees",
                                controller: fees,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Clinic Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextFormField(
                                validators: (value){
                                  if(value == null){
                                    return "this field is required";
                                  }
                                },
                                hint: "add Current location",
                                controller: city,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text),
                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextFormField(
                                validators: (value){
                                  if(value == null){
                                    return "this field is required";
                                  }
                                },
                                hint: "Address",
                                controller: city,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text),
                            SizedBox(
                              height: 2.h,
                            ),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: MyTextFormField(
                                    validators: (value){
                                      if(value == null){
                                        return "this field is required";
                                      }
                                    },
                                    hint: "العنوان",
                                    controller: cityAr,
                                    isPassword: false,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text)),
                            SizedBox(
                              height: 2.h,
                            ),
                            MyTextFormField(
                                validators: (value){
                                  if(value == null){
                                    return "this field is required";
                                  }
                                },
                                hint: "Building number",
                                controller: place,
                                isPassword: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text),
                            SizedBox(
                              height: 2.h,
                            ),
                            Directionality(
                                textDirection: TextDirection.rtl,
                                child: MyTextFormField(
                                    validators: (value){
                                      if(value == null){
                                        return "this field is required";
                                      }
                                    },
                                    hint: "رقم المنبى",
                                    controller: placeAr,
                                    isPassword: false,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.text)),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            AppButton(
                              onPressed: () {
                           if(_formKey.currentState!.validate()){
                             cubit.addDoctorDataa(
                                 name: nameAr.text,
                                 lat: "30.28",
                                 lon: '31.7',
                                 about: about.text,
                                 aboutAR: aboutAr.text,
                                 waitingTime: waitingTime.text,
                                 cityAR: cityAr.text,
                                 city: city.text,
                                 placeNOAr:placeAr.text,
                                 placeNO: place.text,
                                 fees: fees.text,
                                 experience: experince.text);
                           }
                              },
                              margin: EdgeInsets.symmetric(horizontal: 0.sp),
                              padding: EdgeInsets.all(17.sp),
                              label: "Send",
                              bgColor: AppColors.primary,
                              borderRadius: BorderRadius.circular(15.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
