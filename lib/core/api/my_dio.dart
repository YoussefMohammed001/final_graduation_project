import 'package:dio/dio.dart';
import 'package:final_graduation_project/core/api/endpoints.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared.dart';
import 'package:final_graduation_project/core/shared_preferences/my_shared_keys.dart';
import 'package:final_graduation_project/core/utils/easy_loading.dart';
import 'package:final_graduation_project/core/utils/internet_checker.dart';

class AppDio {
  static late Dio _dio;

  static void init() {

    BaseOptions baseOptions = BaseOptions(
        baseUrl: EndPoints.baseUrl,
        followRedirects: false,
        // will not throw errors
        validateStatus: (status) => true,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000 // 60 seconds
        );

    _dio = Dio(baseOptions);
  }

  static Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {

    if(internetAvailable == false){
      hideLoading();
    }
    _dio.options.headers = {

       "lan": MyShared.getCurrentLanguage(),
      // "Accept": "application/json",
      "Authorization": MyShared.getString(key: MySharedKeys.apiToken),
    };

    return await _dio.get(
      endPoint,
      

    );
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


  static Future<Response?> postFile({
    required String endPoint,
    required FormData formData,
  }) async {
    _dio.options.headers = {
      "lan": MyShared.getCurrentLanguage(),
      //"Accept": "application/json",
      "Authorization": "bearer ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await _dio.post(endPoint, data: formData);
  }



  static Future<Response?> delete({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers = {
      "lan": MyShared.getCurrentLanguage(),
      "Accept": "application/json",
      "Authorization": "bearer ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await _dio.delete(endPoint, data: data);
  }


  static Future<Response?> patch({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    _dio.options.headers = {
      "lan": MyShared.getCurrentLanguage(),
      //"Accept": "application/json",
      "Authorization": "bearer ${MyShared.getString(key: MySharedKeys.apiToken)}",
    };
    return await _dio.patch(endPoint, data: data);
  }

}
