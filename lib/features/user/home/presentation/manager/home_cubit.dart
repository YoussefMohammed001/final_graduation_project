import 'package:bloc/bloc.dart';
import 'package:final_graduation_project/core/api/my_dio.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/safe_print.dart';
import 'package:final_graduation_project/features/user/home/data/home_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
List<Specializes> specializes = [];
List<Doctors> doctors = [];
  getHome() async {
    showLoading();
    var response = await AppDio.get(endPoint: "user/",);
    try {
      HomeModel  homeModel = HomeModel.fromJson(response!.data);
      specializes = homeModel.specializes;
      doctors = homeModel.doctors;
      safePrint(response);
      print(doctors.length);
      emit(HomeSuccess());
      hideLoading();
    } catch(e){

    }
    // ignore: empty_catches

  }
}
