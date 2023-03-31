import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/prediction_text_form_field.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiabetesPredictionScreen extends StatelessWidget {
  DiabetesPredictionScreen({Key? key}) : super(key: key);
  TextEditingController numberOfPregnancies = TextEditingController();
  TextEditingController glucoseLevel = TextEditingController();
  TextEditingController bloodPressure = TextEditingController();
  TextEditingController skinCancer = TextEditingController();
  TextEditingController insulinLevel = TextEditingController();
  TextEditingController bodyMassIndex = TextEditingController();
  TextEditingController diabetesPedigreeFunction = TextEditingController();
  TextEditingController patientAge = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(
              title: 'Diabetes Prediction',
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
                                  PredictionTextFormField(
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
                                    },
                                    hint: 'Number of pregnancies',
                                    controller: numberOfPregnancies,
                                    textInputAction: TextInputAction.next,
                                    suffixText: '',
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
                                    },
                                    hint: 'Glucose level',
                                    controller: glucoseLevel,
                                    textInputAction: TextInputAction.next,
                                    suffixText: 'mg/di',
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
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
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
                                    },
                                    hint: 'Skin thickness',
                                    controller: skinCancer,
                                    textInputAction: TextInputAction.next,
                                    suffixText: 'mm',
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
                                    },
                                    hint: 'insulin level',
                                    controller: insulinLevel,
                                    textInputAction: TextInputAction.next,
                                    suffixText: 'iu/ml',
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
                                    },
                                    hint: 'Body mass index',
                                    controller: bodyMassIndex,
                                    textInputAction: TextInputAction.next,
                                    suffixText: 'kg/m2',
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
                                    },
                                    hint: 'Diabetes pedigree function',
                                    controller: diabetesPedigreeFunction,
                                    textInputAction: TextInputAction.next,
                                    suffixText: '',
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  PredictionTextFormField(
                                    validators: (value){
                                      if(value.toString().isEmpty){
                                        return"This field is required";
                                      }
                                      return null;
                                    },
                                    hint: 'Patient ages in years',
                                    controller: patientAge,
                                    textInputAction: TextInputAction.next,
                                    suffixText: '',
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  AppButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                         push(context, const PredictionResultScreen(appBarTitle: 'Diabetes prediction result', result: 'Diabetic', description: 'description description description description description description description description description description description description description description description description description description description ',));
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
