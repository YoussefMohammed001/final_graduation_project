import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';

class AIDio{
  static late Dio _dio;

  static void init() {

    BaseOptions baseOptions = BaseOptions(
        baseUrl: EndPoints.aiBaseUrl,
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000 // 60 seconds
    );

    _dio = Dio(baseOptions);
  }



  static Future<Response?> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers = {
      "lan": MyShared.getCurrentLanguage(),
      //"Accept": "application/json",
      "Authorization": "bearer ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await _dio.post(endPoint, data: data);
  }
}