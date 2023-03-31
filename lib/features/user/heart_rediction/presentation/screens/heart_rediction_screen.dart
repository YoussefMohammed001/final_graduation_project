import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/prediction_text_form_field.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/core/widgets/spinner_text_form_field.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
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
            const CustomAppBar(
              title: 'Heart disease Prediction',
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
                                    "Choose the gender",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SpinnerTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "this field is required";
                                      }
                                    },
                                    textColor: Colors.black,
                                    hint: 'male',
                                    controller: gender,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    enabled: false,
                                    dropDownList: const [
                                      DropDownValueModel(
                                          name: "Male", value: "Male"),
                                      DropDownValueModel(
                                          name: "Female", value: "Female"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "Chest pain type",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SpinnerTextFormField(
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
                                    dropDownList: const [
                                      DropDownValueModel(name: "1", value: "1"),
                                      DropDownValueModel(name: "2", value: "2"),
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
                                    hint: 'Blood pressure',
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
                                    hint: 'Cholesterol',
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
                                  SpinnerTextFormField(
                                    validators: (value) {
                                      if (value.toString().isEmpty) {
                                        return "this field is required";
                                      }
                                    },
                                    textColor: Colors.black,
                                    hint: 'higher than 120',
                                    controller: fPS,
                                    textInputAction: TextInputAction.next,
                                    textInputType: TextInputType.name,
                                    enabled: false,
                                    dropDownList: const [
                                      DropDownValueModel(
                                          name: "higher than 120",
                                          value: "higher than 120"),
                                      DropDownValueModel(
                                          name: "lower than 120",
                                          value: "lower than 120"),
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
                                    hint: 'Electrocardio graph',
                                    controller: electrocardio,
                                    textInputAction: TextInputAction.next,
                                    suffixText: '',
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  AppButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        push(
                                            context,
                                            const PredictionResultScreen(
                                                appBarTitle:
                                                    "Heart disease prediction result",
                                                result: "Infected",
                                                description:
                                                    " description description description description description description description description description v description description description description description description description "));
                                      }
                                    },
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 17.sp),
                                    padding: EdgeInsets.all(17.sp),
                                    label: "Predict",
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
