import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'skin_cancer_state.dart';

class SkinCancerCubit extends Cubit<SkinCancerState> {
  SkinCancerCubit() : super(SkinCancerInitial());
  static late Dio _dio;
  static void init() {

    BaseOptions baseOptions = BaseOptions(
        baseUrl: 'http://127.0.0.1:5000/',
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000 // 60 seconds
    );

    _dio = Dio(baseOptions);
  }



  static Future<Response?> postFile({
    required String image,
  }) async {

    return await _dio.post("predict", data:  FormData.fromMap({
"img": await MultipartFile.fromFile(image),
}),);
  }

}
