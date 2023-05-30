import 'package:final_graduation_project/core/styles/colors.dart';
import 'package:final_graduation_project/core/utils/navigators.dart';
import 'package:final_graduation_project/core/widgets/app_button.dart';
import 'package:final_graduation_project/core/widgets/prediction_text_form_field.dart';
import 'package:final_graduation_project/core/widgets/profile_app_bar.dart';
import 'package:final_graduation_project/features/user/diabetes_prediction/presentation/manager/diabetes_cubit.dart';
import 'package:final_graduation_project/features/user/prediction_result/presentation/screens/prediction_result_screen.dart';
import 'package:final_graduation_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DiabetesPredictionScreen extends StatelessWidget {
  DiabetesPredictionScreen({Key? key}) : super(key: key);
  TextEditingController glucoseLevel = TextEditingController();
  TextEditingController insulinLevel = TextEditingController();
  TextEditingController BMI = TextEditingController();
  TextEditingController patientAge = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final cubit = DiabetesCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<DiabetesCubit, DiabetesState>(
  listener: (context, state) {
    if(state is DiabetesSuccess){
      push(
          context,
          PredictionResultScreen(
              appBarTitle: S().diabetesPredictionResult,
              result: state.message,
              id: '647210dd5ae42d35e118b104',
          ));

    }

  },
  child: Form(
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
                                      validators: (value) {
                                        if (value.toString().isEmpty) {
                                          return "This field is required";
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
                                      validators: (value) {
                                        if (value.toString().isEmpty) {
                                          return "This field is required";
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
                                      validators: (value) {
                                        if (value.toString().isEmpty) {
                                          return "This field is required";
                                        }
                                        return null;
                                      },
                                      hint: S().bodyMassIndex,
                                      controller: BMI,
                                      textInputAction: TextInputAction.next,
                                      suffixText: 'kg/m2',
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    PredictionTextFormField(
                                      validators: (value) {
                                        if (value.toString().isEmpty) {
                                          return "This field is required";
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
                                          double glucose = double.parse(glucoseLevel.text);
                                          double insulin = double.parse(insulinLevel.text);
                                          double bmi = double.parse(BMI.text);
                                          double age = double.parse(patientAge.text);
                                          cubit.prediction(
                                              glucose: glucose,
                                              insulin: insulin,
                                              bmi: bmi,
                                              age: age);
                                             }
                                      },
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 9.sp),
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
