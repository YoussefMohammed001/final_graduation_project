import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/prediction_text_form_field.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
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
             CustomAppBar(
              title: S().diabetes,
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
                                    hint: S().numberOfPregnancies,
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
                                    hint: S().glucoseLevel,
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
                                    hint: S().bloodPressure,
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
                                    hint: S().skinThickness,
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
                                    hint: S().insulinLevel,
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
                                    hint: S().bodyMassIndex,
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
                                    hint: S().diabetesPedigreeFunction,
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
                                    hint: S().patientAgeInYears,
                                    controller: patientAge,
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
                                         push(context, const PredictionResultScreen(appBarTitle: 'Diabetes prediction result', result: 'Diabetic', description: 'description description description description description description description description description description description description description description description description description description description ',));
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
