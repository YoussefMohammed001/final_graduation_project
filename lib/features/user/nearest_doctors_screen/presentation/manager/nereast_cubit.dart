import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/features/user/nearest_doctors_screen/data/nearest_model.dart';
import 'package:meta/meta.dart';

part 'nereast_state.dart';

class NereastCubit extends Cubit<NereastState> {
  NereastCubit() : super(NereastInitial());
List<NearestData> nearestData = [];

  getNearest({required String lat, required String lang}) async {
    showLoading();
    var response = await AppDio.post(endPoint: "user/nearstDoctor",data:
    {
      "Latitude":lat,
      "Longitude":lang,
    }
    );
    try {
      NearestModel  nearestModel = NearestModel.fromJson(response!.data);
      nearestData = nearestModel.nearestData;
      print(response);
      hideLoading();
      emit(NereastSuccess());
      hideLoading();
    } catch(e){

    }
    // ignore: empty_catches

  }
}
