import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/AI_dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/diabetes_prediction/data/diabetes_prediction_model.dart';
import 'package:meta/meta.dart';

part 'diabetes_state.dart';

class DiabetesCubit extends Cubit<DiabetesState> {
  DiabetesCubit() : super(DiabetesInitial());
  DiabetesPredictionModel diabetesPredictionModel = DiabetesPredictionModel();

  prediction({
    required double glucose,
    required double insulin,
    required double bmi,
    required double age,
  }) async {
showLoading();
    var response = await AIDio.post(endPoint: EndPoints.diabetes,
        data: {
            "Glucose":glucose,
            "Insulin":insulin,
            "BMI":bmi,
            "Age":age
        });
    try{

      diabetesPredictionModel = DiabetesPredictionModel.fromJson(response!.data);
        if(diabetesPredictionModel.apiStatus == 'true'){
          hideLoading();
          print(response);
          emit(DiabetesSuccess(diabetesPredictionModel.predicted));
        } else{
          hideLoading();

          emit(DiabetesFailure(diabetesPredictionModel.predicted));
        }
    }catch(e){
      hideLoading();

      emit(DiabetesFailure(diabetesPredictionModel.predicted));
      safePrint("${response}e");
    }

  }



}
