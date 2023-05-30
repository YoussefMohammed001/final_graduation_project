import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/AI_dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/heart_rediction/data/heart_disease_model.dart';
import 'package:meta/meta.dart';

part 'heart_prediction_state.dart';

class HeartPredictionCubit extends Cubit<HeartPredictionState> {
  HeartPredictionCubit() : super(HeartPredictionInitial());
  HeartDiseaseModel heartDiseaseModel = HeartDiseaseModel();
  prediction({
  required String age,
    required String sex,
    required String cp,
    required String trestbps,
    required String chol,
    required String fbs,
    required String restecg,
    required String thalach,
    required String exang,
    required String oldpeak,
    required String slope,
    required String ca,
    required String thal,
  }) async {
    showLoading();
    var response = await AIDio.post(endPoint: EndPoints.predictHeart,
        data: {
          "age":age,
          "sex" :sex,
          "cp" :cp,
          "trestbps":trestbps,
          "chol":chol,
          "fbs" :fbs,
          "restecg" :restecg,
          "thalach" :thalach,
          "exang" :exang,
          "oldpeak" :oldpeak,
          "slope":slope,
          "ca" :ca,
          "thal" :thal
        });
    try{
      heartDiseaseModel = HeartDiseaseModel.fromJson(response!.data);
      if(heartDiseaseModel.apiStatus == 'true'){
        hideLoading();
        print(response);
        emit(HeartPredictionSuccess(heartDiseaseModel.predicted));
      } else{
        hideLoading();

        emit(HeartPredictionFailure());
      }
    }catch(e){
      hideLoading();

      emit(HeartPredictionFailure());
      safePrint("${response}e");
    }

  }

}
