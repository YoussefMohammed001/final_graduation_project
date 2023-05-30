import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/prediction_text_form_field.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/spinner_text_form_field.dart';
import 'package:final_graduation_project/features/user/heart_rediction/presentation/manager/heart_prediction_cubit.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeartPredictionScreen extends StatefulWidget {
  HeartPredictionScreen({Key? key}) : super(key: key);

  @override
  State<HeartPredictionScreen> createState() => _HeartPredictionScreenState();
}

class _HeartPredictionScreenState extends State<HeartPredictionScreen> {
  TextEditingController age = TextEditingController();

  SingleValueDropDownController gender = SingleValueDropDownController();

  SingleValueDropDownController chestPainType = SingleValueDropDownController();

  TextEditingController bloodPressure = TextEditingController();

  TextEditingController cholesterol = TextEditingController();

  SingleValueDropDownController fPS = SingleValueDropDownController();

  SingleValueDropDownController electrocardio = SingleValueDropDownController();

  TextEditingController maxHeartRateAchieved = TextEditingController();

  TextEditingController exerciseIncludeAngina = TextEditingController();

  TextEditingController oldPeak = TextEditingController();

  SingleValueDropDownController slop = SingleValueDropDownController();

  TextEditingController numberOfMajorVessels = TextEditingController();

  SingleValueDropDownController thal = SingleValueDropDownController();

  final _formKey = GlobalKey<FormState>();

  final cubit = HeartPredictionCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<HeartPredictionCubit, HeartPredictionState>(
        listener: (context, state) {
          if (state is HeartPredictionSuccess) {
            push(
                context,
                PredictionResultScreen(
                  appBarTitle: S().heartPredictionResult,
                  result: state.message,
                  id: '643470f814649b678e0d25b6',
                ));
          }
        },
        child: Form(
          key: _formKey,
          child: Scaffold(

            body: Column(
              children: [
                CustomAppBar(
                  title: S().heartDiseases,
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
                                  margin: EdgeInsets.all(17.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      PredictionTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().patientAgeInYears,
                                        controller: age,
                                        textInputAction: TextInputAction.next,
                                        suffixText: '',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        S().chooseTheGender,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      DropDownTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().maleHint,
                                        count: 2,
                                        controller: gender,
                                        dropDownList: [
                                          DropDownValueModel(
                                              name: S().male, value: 1),
                                          DropDownValueModel(
                                              name: S().female, value: 0),
                                        ],
                                        enabled: true,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        S().chestPainType,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      DropDownTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().typicalAngina,
                                        count: 4,
                                        controller: chestPainType,
                                        enabled: false,
                                        dropDownList: [
                                          DropDownValueModel(
                                              name: S().typicalAngina,
                                              value: 1),
                                          DropDownValueModel(
                                              name: S().aTypicalAngina,
                                              value: 2),
                                          DropDownValueModel(
                                              name: S().nonAnginalPain,
                                              value: 3),
                                          DropDownValueModel(
                                              name: S().asymptomatic, value: 4),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PredictionTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().bloodPressure,
                                        controller: bloodPressure,
                                        textInputAction: TextInputAction.next,
                                        suffixText: 'mg/di',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PredictionTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().cholesterol,
                                        controller: cholesterol,
                                        textInputAction: TextInputAction.next,
                                        suffixText: 'mg/di',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        "FPS",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      DropDownTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().higherThan120Hint,
                                        controller: fPS,
                                        enabled: false,
                                        count: 2,
                                        dropDownList: [
                                          DropDownValueModel(
                                            name: S().higherThan120,
                                            value: 0,
                                          ),
                                          DropDownValueModel(
                                            name: S().lowerThan120,
                                            value: 1,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        S().electrocardioGraphic,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      DropDownTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        count: 3,
                                        hint: "0",
                                        controller: electrocardio,
                                        enabled: false,
                                        dropDownList: const [
                                          DropDownValueModel(
                                            name: "0",
                                            value: 0,
                                          ),
                                          DropDownValueModel(
                                            name: "1",
                                            value: 1,
                                          ),
                                          DropDownValueModel(
                                            name: "2",
                                            value: 2,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PredictionTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().maximumheartrateachieved,
                                        controller: maxHeartRateAchieved,
                                        textInputAction: TextInputAction.next,
                                        suffixText: 'thalach',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PredictionTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint: S().practicofangina,
                                        controller: exerciseIncludeAngina,
                                        textInputAction: TextInputAction.next,
                                        suffixText: 'exang',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        S().slope,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp),
                                      ),
                                      DropDownTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        count: 3,
                                        hint: S().up,
                                        controller: slop,
                                        enabled: false,
                                        dropDownList:  [
                                          DropDownValueModel(
                                              name: S().up, value: 0),
                                          DropDownValueModel(
                                              name: S().flat, value: 1),
                                          DropDownValueModel(
                                              name: S().down, value: 2),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PredictionTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint:
                                           S().oldPeak,
                                        controller: oldPeak,
                                        textInputAction: TextInputAction.next,
                                        suffixText: 'oldPeak',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      PredictionTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        hint:
                                            S().ca,
                                        controller: numberOfMajorVessels,
                                        textInputAction: TextInputAction.next,
                                        suffixText: 'ca',
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        "thal",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.sp),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      DropDownTextFormField(
                                        validators: (value) {
                                          if (value.toString().isEmpty) {
                                            return S().required;
                                          }
                                        },
                                        count: 3,
                                        hint: '',
                                        controller: thal,
                                        enabled: false,
                                        dropDownList:  [
                                          DropDownValueModel(
                                              name: S().normal, value: 1),
                                          DropDownValueModel(
                                              name: S().fixeddefected, value: 6),
                                          DropDownValueModel(
                                              name: S().reversibledefected,
                                              value: 7),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Spacer(),
                                      AppButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            cubit.prediction(
                                                age: age.text,
                                                sex: gender.dropDownValue!.value
                                                    .toString(),
                                                cp: chestPainType
                                                    .dropDownValue!.value
                                                    .toString(),
                                                trestbps: bloodPressure.text,
                                                chol: cholesterol.text,
                                                fbs: fPS.dropDownValue!.value
                                                    .toString(),
                                                restecg: electrocardio
                                                    .dropDownValue!.value
                                                    .toString(),
                                                thalach:
                                                    maxHeartRateAchieved.text,
                                                exang:
                                                    exerciseIncludeAngina.text,
                                                slope: slop.dropDownValue!.value
                                                    .toString(),
                                                ca: numberOfMajorVessels.text,
                                                thal: thal.dropDownValue!.value
                                                    .toString(),
                                                oldpeak: oldPeak.text);
                                          }
                                        },
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 17.sp),
                                        padding: EdgeInsets.all(17.sp),
                                        label: S().predict,
                                        bgColor: AppColors.primary,
                                        borderRadius:
                                            BorderRadius.circular(15.sp),
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
          ),
        ),
      ),
    );
  }
}
