import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';

class AppDio {
  static late Dio _dio;


  static void  init() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
        connectTimeout: 60*1000, // 60 seconds
        receiveTimeout: 60*1000 // 60 seconds
    );

    _dio = Dio(baseOptions);

  }
  static Future<Response?> get({
    required String endPoint,
  }) async {
    _dio.options.headers = {
      // "lang": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      // "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };

    return await _dio.get(endPoint,
    );

  }


// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2M2ZlMmZjZTE2YmExOGFjODYzNDQ2NWYiLCJpYXQiOjE2Nzc2MDgxOTl9.KLM-E4lNYxn3ZHpsWhjTrzAn4UQuY_AX1ltYAR_7SrY
  static Future<Response?> post({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers = {
       "lang": MyShared.getCurrentLanguage(),
       "Accept": "application/json",
       "Authorization": "bearer ${MyShared.getString(key: MySharedKeys.apiToken)}",
     };
    return await _dio.post(endPoint,data: data);


  }





}