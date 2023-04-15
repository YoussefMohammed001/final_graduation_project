import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/core/utils/svg.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/app_text_field.dart';
import 'package:final_graduation_project/core/widgets/spinner_text_form_field.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/manager/login_cubit.dart';
import 'package:final_graduation_project/features/Authentication/login/presentation/pages/login_screen.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/presentation/manager/verify_cubit.dart';
import 'package:final_graduation_project/features/Authentication/verifyAccount/presentation/pages/verify_account_screen.dart';
import 'package:final_graduation_project/features/doctor/doctor_register_screen/data/specialized_model.dart';
import 'package:final_graduation_project/features/doctor/doctor_register_screen/presentation/manager/doctor_register_cubit.dart';
import 'package:final_graduation_project/features/user/skin_cancer_prediction/presentation/widgets/skin_cancer_text_form_field.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class RegisterScreenDoctor extends StatefulWidget {
  RegisterScreenDoctor({Key? key}) : super(key: key);

  @override
  State<RegisterScreenDoctor> createState() => _RegisterScreenDoctorState();
}

class _RegisterScreenDoctorState extends State<RegisterScreenDoctor> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  SingleValueDropDownController specialization =
      SingleValueDropDownController();

  final cubit = DoctorRegisterCubit();
  @override
  void initState() {
    // TODO: implement initState
    cubit.getSpecialist();
    super.initState();
  }
  // File? _image;
  // final pickedFile = ImagePicker();
  //
  // uploadProfileImage() async {
  //
  //   var pickedImage = await pickedFile.getImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //
  //     });
  //   }
  // }
  //
  // File? licenceImg;
  // uploadLicence() async {
  //   var pickedImage = await pickedFile.getImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       licenceImg = File(pickedImage.path);
  //
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<DoctorRegisterCubit, DoctorRegisterState>(
        listener: (context, state) {
          if (state is DoctorRegisterLoading) {
            showLoading();
          }
          if (state is DoctorRegisterSuccess) {
            push(
                context,
                BlocProvider(
                  create: (context) => VerifyCubit(),
                  child: VerifyAccountScreen(),
                ));
            hideLoading();
            showSuccess(state.message);
          }
          if (state is DoctorRegisterFailure) {
            hideLoading();
            showError(state.message);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              body: Column(
                children: [
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
                                Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  children: [
                                    Image.asset(
                                      "assets/images/bk.png",
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(17.sp),
                                      child: Column(children: [
                                        SizedBox(
                                          height: 45.h,
                                        ),
                                        MyTextFormField(
                                          validators: (value) {
                                            if (value!.isEmpty) {
                                              return "Username is Required";
                                            }

                                            return null;
                                          },
                                          textInputAction: TextInputAction.next,
                                          hint: S().enterYourName,
                                          isPassword: false,
                                          controller: nameController,
                                          textInputType: TextInputType.text,
                                        ),
                                        SizedBox(height: 1.h),
                                        MyTextFormField(
                                          validators: (value) {
                                            if (value!.isEmpty) {
                                              return "Email is required";
                                            }
                                            if (!value.contains("@") ||
                                                !value.contains(".")) {
                                              return "Email Not Valid";
                                            }
                                            return null;
                                          },
                                          textInputType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          controller: emailController,
                                          hint: S().enterYourEmail,
                                          isPassword: false,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        MyTextFormField(
                                          validators: (value) {
                                            if (value!.isEmpty) {
                                              return "Mobile Number";
                                            }
                                            if (value.length != 11) {
                                              return "Mobile number not valid";
                                            }
                                            return null;
                                          },
                                          textInputType:
                                              TextInputType.emailAddress,
                                          textInputAction: TextInputAction.next,
                                          controller: mobileController,
                                          hint: S().mobileNumber,
                                          isPassword: false,
                                        ),
                                        SizedBox(height: 1.h),
                                        MyTextFormField(
                                          validators: (value) {
                                            if (value!.isEmpty) {
                                              return "Password is required";
                                            }
                                            if (value.length < 6) {
                                              return "Password Not Valid";
                                            }
                                            return null;
                                          },
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.done,
                                          controller: passwordController,
                                          hint: S().password,
                                          isPassword: true,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        DropDownTextFormField(
                                          hint: 'Specialization',
                                          controller: specialization,
                                          enabled: false,
                                          dropDownList: List.generate(
                                              cubit.specializedData.length,
                                              (index) {
                                            SpecializedData data =
                                                cubit.specializedData[index];
                                            return DropDownValueModel(
                                                name: data.name,
                                                value: data.id);
                                          }),
                                          count: cubit.specializedData.length,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        AppButton(
                                          onPressed: () {
                                            int phone = int.parse(
                                                mobileController.text);
                                            if (formKey.currentState!
                                                .validate()) {
                                              cubit.doctorRegister(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  confirmPassword:
                                                      confirmPasswordController
                                                          .text,
                                                  phoneNumber: phone,
                                                  specialization: specialization.dropDownValue!.value);

                                            }
                                          },
                                          label: S().joinNow,
                                          bgColor: AppColors.primary,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 17.sp),
                                          padding: EdgeInsets.all(17.sp),
                                          borderRadius:
                                              BorderRadius.circular(15.sp),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(S().alreadyHaveAccount),
                                            InkWell(
                                              onTap: () {
                                                push(
                                                    context,
                                                    BlocProvider(
                                                      create: (context) =>
                                                          LoginCubit(),
                                                      child:
                                                          const LoginScreen(),
                                                    ));
                                              },
                                              child: Text(
                                                S().signIn,
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
