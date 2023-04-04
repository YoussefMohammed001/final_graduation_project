import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/prediction_text_form_field.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/spinner_text_form_field.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeartPredictionScreen extends StatelessWidget {
  HeartPredictionScreen({Key? key}) : super(key: key);

  TextEditingController bloodPressure = TextEditingController();
  TextEditingController cholesterol = TextEditingController();
  TextEditingController electrocardio = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  SingleValueDropDownController gender = SingleValueDropDownController();
  SingleValueDropDownController chestPainType = SingleValueDropDownController();
  SingleValueDropDownController fPS = SingleValueDropDownController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                  S().chooseTheGender,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  DropDownTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "this field is required";
                                      }
                                    },
                                    textColor: Colors.black,
                                    hint: S().maleHint,
                                    controller: gender,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    enabled: false,
                                    dropDownList:  [
                                      DropDownValueModel(
                                          name: S().male, value: S().male),
                                      DropDownValueModel(
                                          name: S().female, value: S().female),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    S().chestPainType,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  DropDownTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "this field is required";
                                      }
                                    },
                                    textColor: Colors.black,
                                    hint: '1',
                                    controller: chestPainType,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    enabled: false,
                                    dropDownList:  [
                                      DropDownValueModel(name: S().typicalAngina, value: S().typicalAngina),
                                      DropDownValueModel(name: S().aTypicalAngina, value: S().typicalAngina),
                                      DropDownValueModel(name: S().nonAnginalPain, value: S().nonAnginalPain),
                                      DropDownValueModel(name: S().asymptomatic, value: S().asymptomatic),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "This field is required";
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
                                        return "This field is required";
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
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  DropDownTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "this field is required";
                                      }
                                    },
                                    textColor: Colors.black,
                                    hint: S().higherThan120Hint,
                                    controller: fPS,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    enabled: false,
                                    dropDownList:  [
                                      DropDownValueModel(
                                          name: S().higherThan120,
                                          value:  S().higherThan120,
                                      ),

                                      DropDownValueModel(
                                          name: S().lowerThan120,
                                          value:  S().lowerThan120,
                                      ),

                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "This field is required";
                                      }
                                    },
                                    hint: S().electrocardioGraphic,
                                    controller: electrocardio,
                                    textInputAction: TextInputAction.next,
                                    suffixText: '',
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Spacer(),

                                  AppButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        push(
                                            context,
                                             PredictionResultScreen(
                                                appBarTitle:
                                                    S().heartDiseases,
                                                result: "Infected",

                                                description:
                                                    " description description description description description description description description description v description description description description description description description "));
                                      }
                                    },
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 17.sp),
                                    padding: EdgeInsets.all(17.sp),
                                    label: S().predict,
                                    bgColor: AppColors.primary,
                                    borderRadius: BorderRadius.circular(15.sp),
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
    );
  }
}
